[About env variables for KMonad](https://github.com/kmonad/kmonad/blob/master/doc/faq.md#q-how-do-i-use-the-same-layout-definition-for-different-keyboards).

Need to add environment variable `KBD_DEV`. Example of path:

```sh
export KBD_DEV="/dev/input/by-path/some-name-event-kbd"
```
