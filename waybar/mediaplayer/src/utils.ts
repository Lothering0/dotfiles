import { Effect, pipe, Console, Option, Array, Duration } from 'effect'
import {
  Info,
  PlayerName,
  PlayerStatus,
  Song,
  WaybarAltStatus,
  WaybarCustomModuleBody,
} from './types'
import * as fs from 'node:fs/promises'

export const appendFile = (file: string) => (content: string) =>
  Effect.try(() => fs.appendFile(file, content))

const getAlt = (player: PlayerName, status: PlayerStatus) =>
  status === PlayerStatus.PLAYING
    ? `${player}-${WaybarAltStatus.PLAYING}`
    : `${player}-${WaybarAltStatus.PAUSED}`

const getDescriptionPart = (
  title: string,
  optionValue: Option.Option<string>,
) => optionValue.pipe(Option.map(value => `${title}:\n${value}`))

const getDescription = (song: Song) =>
  pipe(
    [
      getDescriptionPart('Artist', song.artist),
      getDescriptionPart('Song', song.title),
      getDescriptionPart('Album', song.album),
    ],
    Array.getSomes,
    Array.join('\n\n'),
  )

const getProgressPercent = (song: Song) =>
  pipe(
    (Duration.toMillis(song.position) / Duration.toMillis(song.length)) * 100,
    Math.floor,
  )

const getCssClass = (info: Info) =>
  [info.player, `progress-${getProgressPercent(info.song)}`] as const

const getText = (song: Song) =>
  pipe([song.artist, song.title], Array.getSomes, Array.join(' - '))

export const getBodyFromInfo = (info: Info): WaybarCustomModuleBody => ({
  text: getText(info.song),
  alt: getAlt(info.player, info.status),
  tooltip: getDescription(info.song),
  class: getCssClass(info),
  percentage: getProgressPercent(info.song),
})

export const sendBody = (body: WaybarCustomModuleBody) =>
  pipe(body, JSON.stringify, Console.log)
