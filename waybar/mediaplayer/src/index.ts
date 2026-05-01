import * as childProcess from 'node:child_process'
import {
  Effect,
  Console,
  Schedule,
  pipe,
  Data,
  Option,
  Schema,
  Duration,
  Array,
} from 'effect'
import { promisify } from 'node:util'

interface WaybarCustomModuleBody {
  readonly text: string
  readonly alt: string
  readonly tooltip: string
  readonly class: Array.NonEmptyReadonlyArray<string>
  readonly percentage: number
}

const DEFAULT_BODY: WaybarCustomModuleBody = {
  text: "It's pretty quiet here...",
  alt: 'default',
  tooltip: '',
  class: ['default'],
  percentage: 0,
}

enum PlayerName {
  SPOTIFY = 'spotify',
  TELEGRAM = 'TelegramDesktop',
  CMUS = 'cmus',
}

const PLAYERS = [PlayerName.SPOTIFY, PlayerName.TELEGRAM, PlayerName.CMUS] as const

class NoPlayerRunningException extends Data.TaggedError('NoPlayerRunningException') {}

const runCommand = (command: string) =>
  pipe(
    Effect.tryPromise(() => pipe(command, promisify(childProcess.exec))),
    Effect.map(({ stdout }) => String(stdout).trim()),
  )

const trimOption = (string: string | undefined | null) =>
  pipe(
    Option.fromNullable(string),
    Option.map(string => string.trim()),
    Option.andThen(string => (string.length > 0 ? Option.some(string) : Option.none())),
  )

const sendToMediaplayer = (body: WaybarCustomModuleBody) =>
  pipe(body, JSON.stringify, Console.log)

const currentInfo = pipe(
  runCommand(
    `playerctl --player=${PLAYERS} metadata --format="{{ playerName }}\n{{ status }}\n{{ xesam:artist }}\n{{ xesam:title }}\n{{ xesam:album }}\n{{ position }}\n{{ mpris:length }}"`,
  ),
  Effect.map(stdout => stdout.split('\n')),
  Effect.map(([player, status, artist, title, album, position, length]) => ({
    player: trimOption(player),
    status: trimOption(status),
    artist: trimOption(artist),
    title: trimOption(title),
    album: trimOption(album),
    position: trimOption(position),
    length: trimOption(length),
  })),
  Effect.bindTo('info'),
  Effect.bind('player', ({ info }) =>
    pipe(
      info.player,
      Option.map(player => (player === PlayerName.TELEGRAM ? 'telegram' : player)),
      Option.map(player => player.toLowerCase()),
      Option.map(Effect.succeed),
      Option.getOrElse(() => Effect.fail(new NoPlayerRunningException())),
    ),
  ),
  Effect.bind('position', ({ info }) =>
    pipe(
      info.position,
      Option.getOrElse(() => ''),
      Schema.decode(Schema.NumberFromString),
      Effect.map(Duration.millis),
    ),
  ),
  Effect.bind('length', ({ info }) =>
    pipe(
      info.length,
      Option.getOrElse(() => ''),
      Schema.decode(Schema.NumberFromString),
      Effect.map(Duration.millis),
    ),
  ),
  Effect.map(({ info, player, position, length }) => ({
    player,
    isPlaying: pipe(
      info.status,
      Option.map(status => status === 'Playing'),
      Option.getOrElse(() => false),
    ),
    song: {
      artist: info.artist,
      title: info.title,
      album: info.album,
      position,
      length,
    },
  })),
  Effect.orElseFail(() => new NoPlayerRunningException()),
)

pipe(
  currentInfo,
  Effect.bindTo('info'),
  Effect.let('positionMs', ({ info }) => Duration.toMillis(info.song.position)),
  Effect.let('lengthMs', ({ info }) => Duration.toMillis(info.song.length)),
  Effect.let('progressPercent', ({ positionMs, lengthMs }) =>
    Math.floor((positionMs / lengthMs) * 100),
  ),
  Effect.map(({ info, progressPercent }) => ({
    text: Array.getSomes([info.song.artist, info.song.title]).join(' - '),
    alt: info.isPlaying ? `${info.player}-playing` : `${info.player}-paused`,
    tooltip: Array.getSomes([
      info.song.artist.pipe(Option.map(artist => `Artist:\n${artist}`)),
      info.song.title.pipe(Option.map(song => `Song:\n${song}`)),
      info.song.album.pipe(Option.map(album => `Album:\n${album}`)),
    ]).join('\n\n'),
    class: [info.player, `progress-${progressPercent}`] as const,
    percentage: progressPercent,
  })),
  Effect.catchTag('NoPlayerRunningException', () => Effect.succeed(DEFAULT_BODY)),
  Effect.tap(body => sendToMediaplayer(body)),
  Effect.repeat({ schedule: Schedule.spaced('1 second') }),
  Effect.runPromise,
)
