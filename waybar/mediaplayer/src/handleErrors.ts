/* import {
  pipe,
  Json,
  String,
  Matching,
  UnknownException,
  Effect,
  flow,
} from 'my-fp-ts'
import { appendFile } from './utils'
import { main } from './main'

const getErrorMessage = (e: Effect.Failures<typeof main>): string =>
  pipe(
    e,
    Matching.match,
    Matching.whenInstance(UnknownException, e =>
      pipe(e.exception, Json.stringify),
    ),
    Matching.getOrElse((e: unknown) => pipe(e, Json.stringify)),
  )

export const handleErrors = flow(
  getErrorMessage,
  String.prepend(`${new Date().toISOString()} [ERROR]: `),
  String.append('\n'),
  appendFile(`${__dirname}/../log.txt`),
) */
