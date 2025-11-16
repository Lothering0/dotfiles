import { Effect, pipe } from 'my-fp-ts'
import { currentInfo } from './commands'
import { getBodyFromInfo, sendBody } from './utils'
import { DEFAULT_BODY } from './constants'

export const main = pipe(
  currentInfo,
  Effect.map(getBodyFromInfo),
  Effect.tap(sendBody),
  Effect.catchTag('NoPlayerRunningException', () =>
    pipe(DEFAULT_BODY, sendBody),
  ),
)
