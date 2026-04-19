# homebrew-sendy-md

Homebrew tap for the [sendy.md](https://sendy.md) CLI.

## Install

```bash
brew install achronon/sendy-md/sendy
```

Or, if you tap explicitly first:

```bash
brew tap achronon/sendy-md
brew install sendy
```

Upgrades:

```bash
brew update
brew upgrade sendy
```

## What's inside

A single Go-built `sendy` binary. Paste terminal output to
[sendy.md](https://sendy.md) and get back a rendered-markdown link.

```bash
echo "hello" | sendy
sendy README.md
sendy login
sendy list --limit 10
sendy view <slug>
```

See the main repo for full documentation:
<https://github.com/Achronon/sendy-md/tree/main/cli>.

## How this tap is built

Each `cli-v*` tag on [Achronon/sendy-md](https://github.com/Achronon/sendy-md)
triggers a release workflow that cross-compiles the CLI for
darwin/linux × amd64/arm64 and publishes the binaries as GitHub Release
assets. The `Formula/sendy.rb` here points at those asset URLs with
pinned SHA256 hashes.

Bumping the formula to a new CLI version is currently manual — update
`version` and the four `sha256` values in `Formula/sendy.rb`. Automating
this via a follow-up workflow that opens a bump PR is on the backlog.

## License

MIT — same as the upstream CLI.
