import { Effect, pipe } from 'effect'
import { currentInfo } from './commands'
import { getBodyFromInfo, sendBody } from './utils'
import { DEFAULT_BODY } from './constants'

export const main = currentInfo.pipe(
  Effect.map(getBodyFromInfo),
  Effect.tap(sendBody),
  Effect.catchTag('NoPlayerRunningException', () =>
    pipe(DEFAULT_BODY, sendBody),
  ),
)
