import { Json, Record, Option } from 'my-fp-ts'

export enum PlayerName {
  SPOTIFY = 'spotify',
  TELEGRAM = 'telegram',
}

export enum PlayerCliName {
  SPOTIFY = 'spotify',
  TELEGRAM = 'TelegramDesktop',
}

export enum PlayerStatus {
  PLAYING = 'Playing',
  PAUSED = 'Paused',
}

export enum WaybarAltStatus {
  PLAYING = 'playing',
  PAUSED = 'paused',
}

export interface Info {
  readonly player: PlayerName
  readonly status: PlayerStatus
  readonly song: Song
}

export interface Song {
  readonly artist: Option.Option<string>
  readonly title: Option.Option<string>
  readonly album: Option.Option<string>
}

export interface WaybarCustomModuleBody
  extends Record.ReadonlyRecord<string, Json.Json> {
  readonly text: string
  readonly alt: string
  readonly tooltip: string
  readonly class: string
  readonly percentage: number
}
