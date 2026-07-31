# homebrew-dn

Homebrew tap for the [`dn`](https://github.com/chesapeakedev/dn) CLI.

## Install

```bash
brew install chesapeakedev/dn/dn
```

Or tap first:

```bash
brew tap chesapeakedev/dn
brew install dn
```

## Upgrade

```bash
brew update
brew upgrade dn
```

## Formula updates

After a `dn` GitHub release publishes binaries, bump this formula from the `dn`
repository:

```bash
# from chesapeakedev/dn
deno run -A scripts/bump_homebrew_formula.ts --version 0.0.35
```

That script updates `Formula/dn.rb` in a collocated `../homebrew-dn` checkout
(or `HOMEBREW_DN_TAP`) using checksums from the GitHub release.
