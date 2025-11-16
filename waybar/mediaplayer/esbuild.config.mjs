import * as esbuild from 'esbuild'

await esbuild.build({
  platform: 'node',
  resolveExtensions: ['.ts', '.js', '.cjs'],
  bundle: true,
  entryPoints: ['src/index.ts'],
  outdir: 'dist',
  outExtension: {
    '.js': '.cjs',
  },
})
