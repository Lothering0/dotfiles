import { Effect, Schedule } from 'effect'
// import { handleErrors } from './handleErrors'
import { main } from './main'

main.pipe(
  // Effect.tapError(handleErrors),
  Effect.repeat({ schedule: Schedule.spaced('2 seconds') }),
  Effect.runPromise,
)
