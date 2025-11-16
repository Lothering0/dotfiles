import { identity, Effect, pipe, Json, Console, Option, Array } from 'my-fp-ts'
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
) =>
  pipe(
    optionValue,
    Option.map(value => `${title}:\n${value}`),
  )

const getDescription = (song: Song) =>
  pipe(
    [
      getDescriptionPart('Artist', song.artist),
      getDescriptionPart('Song', song.title),
      getDescriptionPart('Album', song.album),
    ],
    Array.compact,
    Array.join('\n\n'),
  )

const getCssClass = identity<PlayerName>

const getText = (song: Song) =>
  pipe([song.artist, song.title], Array.compact, Array.join(' - '))

export const getBodyFromInfo = (info: Info): WaybarCustomModuleBody => ({
  text: getText(info.song),
  alt: getAlt(info.player, info.status),
  tooltip: getDescription(info.song),
  class: getCssClass(info.player),
  percentage: 50,
})

export const sendBody = (body: WaybarCustomModuleBody) =>
  pipe(body, Json.stringify, Console.log)
