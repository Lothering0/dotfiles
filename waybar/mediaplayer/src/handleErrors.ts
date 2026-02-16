/* import { String, Match, Effect, flow } from 'effect'
import { appendFile } from './utils'
import { main } from './main'
import { UnknownException } from 'effect/Cause'

const getErrorMessage = (e: Effect.Effect.Error<typeof main>): string =>
  Match.value(e).pipe(
    Match.when(Match.instanceOf(UnknownException), e => e.message),
    Match.exhaustive,
  )

export const handleErrors = flow(
  getErrorMessage,
  message => String.concat(`${new Date().toISOString()} [ERROR]: `, message),
  String.concat('\n'),
  appendFile(`${__dirname}/../log.txt`),
) */
