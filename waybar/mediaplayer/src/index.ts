import { Effect, pipe } from 'my-fp-ts'
// import { handleErrors } from './handleErrors'
import { main } from './main'

pipe(
  main,
  // Effect.tapLeft(handleErrors),
  Effect.schedule({ seconds: 2 }),
  Effect.runAsync(),
)
