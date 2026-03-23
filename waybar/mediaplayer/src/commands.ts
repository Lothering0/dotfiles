import * as childProcess from 'node:child_process'
import { Effect, pipe, Option, Data, Schema, Duration } from 'effect'
import { promisify } from 'node:util'
import { PLAYERS } from './constants'
import { Info, PlayerName, PlayerStatus } from './types'

const runCommand = (command: string) =>
  pipe(
    Effect.tryPromise(() => pipe(command, promisify(childProcess.exec))),
    Effect.map(({ stdout }) => String(stdout).trim()),
  )

const runCommandOption = (command: string) =>
  runCommand(command).pipe(
    Effect.map(Option.some),
    Effect.orElseSucceed(Option.none),
  )

const currentStatus = runCommand(`playerctl --player=${PLAYERS} status`).pipe(
  Effect.map(status =>
    status === PlayerStatus.PLAYING
      ? PlayerStatus.PLAYING
      : PlayerStatus.PAUSED,
  ),
)

const currentSongArtist = runCommandOption(
  `playerctl --player=${PLAYERS} metadata xesam:artist`,
)

const currentSongTitle = runCommandOption(
  `playerctl --player=${PLAYERS} metadata xesam:title`,
)

const currentSongAlbum = runCommandOption(
  `playerctl --player=${PLAYERS} metadata xesam:album`,
)

const currentSongPosition = runCommandOption(
  `playerctl --player=${PLAYERS} position`,
).pipe(
  Effect.andThen(Option.getOrElse(() => '')),
  Effect.andThen(Schema.decode(Schema.NumberFromString)),
  Effect.map(n => n * 1000),
  Effect.map(Math.floor),
  Effect.map(Duration.millis),
)

const currentSongLength = runCommandOption(
  `playerctl --player=${PLAYERS} metadata mpris:length`,
).pipe(
  Effect.andThen(Option.getOrElse(() => '')),
  Effect.andThen(Schema.decode(Schema.NumberFromString)),
  Effect.map(n => n / 1000),
  Effect.map(Duration.millis),
)

const isCmusRunning = runCommand('pgrep cmus')
const isSpotifyRunning = runCommand('pgrep spotify')
const isTelegramRunning = runCommand('pgrep Telegram')

export const currentPlayer = isCmusRunning.pipe(
  Effect.as(PlayerName.CMUS),
  Effect.orElse(() => isSpotifyRunning.pipe(Effect.as(PlayerName.SPOTIFY))),
  Effect.orElse(() => isTelegramRunning.pipe(Effect.as(PlayerName.TELEGRAM))),
)

export class NoPlayerRunningException extends Data.TaggedError(
  'NoPlayerRunningException',
) {}

export const currentInfo = Effect.all({
  status: currentStatus,
  songArtist: currentSongArtist,
  songTitle: currentSongTitle,
  songAlbum: currentSongAlbum,
  songPosition: currentSongPosition,
  songLength: currentSongLength,
  player: currentPlayer,
}).pipe(
  Effect.orElseFail(() => new NoPlayerRunningException()),
  Effect.map(
    ({
      player,
      status,
      songArtist,
      songTitle,
      songAlbum,
      songPosition,
      songLength,
    }): Info => ({
      player,
      status,
      song: {
        artist: songArtist,
        title: songTitle,
        album: songAlbum,
        position: songPosition,
        length: songLength,
      },
    }),
  ),
)
