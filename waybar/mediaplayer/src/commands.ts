import * as childProcess from 'node:child_process'
import { Effect, pipe, Exception, Option } from 'my-fp-ts'
import { promisify } from 'node:util'
import { PLAYERS } from './constants'
import { Info, PlayerName, PlayerStatus } from './types'

export const runCommand = (command: string) =>
  pipe(
    Effect.try(() => pipe(command, promisify(childProcess.exec))),
    Effect.map(({ stdout }) => String(stdout).trim()),
  )

export const runCommandOption = (command: string) =>
  pipe(
    command,
    runCommand,
    Effect.map(Option.some),
    Effect.orElseSucceed(Option.none()),
  )

export const currentStatus = pipe(
  `playerctl --player=${PLAYERS} status`,
  runCommand,
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

export const currentPlayer = pipe(
  isSpotifyRunning,
  Effect.as(PlayerName.SPOTIFY),
  Effect.orElse(pipe(isTelegramRunning, Effect.as(PlayerName.TELEGRAM))),
)

export class NoPlayerRunningException extends Exception.TaggedError(
  'NoPlayerRunningException',
) {}

export const currentInfo = pipe(
  Effect.all([
    currentStatus,
    currentSongArtist,
    currentSongTitle,
    currentSongAlbum,
    currentPlayer,
  ]),
  Effect.orElseFail(new NoPlayerRunningException()),
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
