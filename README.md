# pandoc-test

Testing out Pandoc with GHCjs

## Preparing GHCjs

In `ghcjs` directory we have automated script that allows to build GHCjs in reproducible manner and use along with stack by spcifying compiler option

```yaml
compiler: ghcjs-0.2.0.9011009_ghc-8.4.1
setup-info:
  ghcjs:
    source:
      ghcjs-0.2.0.9011009_ghc-8.4.1:
          url: /opt/ghcjs.tar.gz
```

For stack < v2.2 `stack setup` will install ghcjs correctly. Latest version removes GHCjs build functionality completely. So, you need to:

```
$ cd prepare-ghcjs
$ tar -xzf ghcjs.tar.gz
$ cd ghcjs
$ stack build
$ stack exec -- ghcjs-boot
$ stack install
```

which in both case will take a long time.
