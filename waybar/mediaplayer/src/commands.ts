import * as childProcess from 'node:child_process'
import { Effect, pipe, Option, Data } from 'effect'
import { promisify } from 'node:util'
import { PLAYERS } from './constants'
import { Info, PlayerName, PlayerStatus } from './types'

export const runCommand = (command: string) =>
  pipe(
    Effect.tryPromise(() => pipe(command, promisify(childProcess.exec))),
    Effect.map(({ stdout }) => String(stdout).trim()),
  )

export const runCommandOption = (command: string) =>
  runCommand(command).pipe(
    Effect.map(Option.some),
    Effect.orElseSucceed(Option.none),
  )

export const currentStatus = runCommand(
  `playerctl --player=${PLAYERS} status`,
).pipe(
  Effect.map(status =>
    status === PlayerStatus.PLAYING
      ? PlayerStatus.PLAYING
      : PlayerStatus.PAUSED,
  ),
)

export const currentSongArtist = runCommandOption(
  `playerctl --player=${PLAYERS} metadata xesam:artist`,
)

export const currentSongTitle = runCommandOption(
  `playerctl --player=${PLAYERS} metadata xesam:title`,
)

export const currentSongAlbum = runCommandOption(
  `playerctl --player=${PLAYERS} metadata xesam:album`,
)

const isSpotifyRunning = runCommand('pgrep spotify')

const isTelegramRunning = runCommand('pgrep Telegram')

export const currentPlayer = isSpotifyRunning.pipe(
  Effect.as(PlayerName.SPOTIFY),
  Effect.orElse(() => isTelegramRunning.pipe(Effect.as(PlayerName.TELEGRAM))),
)

export class NoPlayerRunningException extends Data.TaggedError(
  'NoPlayerRunningException',
) {}

export const currentInfo = Effect.all([
  currentStatus,
  currentSongArtist,
  currentSongTitle,
  currentSongAlbum,
  currentPlayer,
]).pipe(
  Effect.orElseFail(() => new NoPlayerRunningException()),
  Effect.map(
    ([status, songArtist, songTitle, songAlbum, player]): Info => ({
      player,
      status,
      song: {
        artist: songArtist,
        title: songTitle,
        album: songAlbum,
      },
    }),
  ),
)
