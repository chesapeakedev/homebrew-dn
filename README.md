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

The `dn` Release Binary workflow updates `Formula/dn.rb` automatically after
each release (requires `HOMEBREW_TAP_TOKEN` on `chesapeakedev/dn`).

Manual recovery from a collocated `dn` checkout:

```bash
deno run -A scripts/bump_homebrew_formula.ts --version 0.0.35
cd ../homebrew-dn
git add Formula/dn.rb
git commit -m "dn 0.0.35"
git push
```
