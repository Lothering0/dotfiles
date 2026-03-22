import { PlayerCliName, WaybarCustomModuleBody } from './types'

export const PLAYERS = [
  PlayerCliName.SPOTIFY,
  PlayerCliName.TELEGRAM,
  PlayerCliName.CMUS,
] as const

export const DEFAULT_BODY: WaybarCustomModuleBody = {
  text: "It's pretty quiet here...",
  alt: 'default',
  tooltip: '',
  class: ['default'],
  percentage: 0,
}
