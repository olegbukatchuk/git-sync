# git-sync

_A container image for synchronizing git repositories over HTTPS_

*Features*:
* Authentication with https tokens
* Two way synchronization
* Delete branches on destination once they were delted at the source (prune)
* Use a different HTTPS Proxy for source and destination
* [TLS-Trust On First Use]: Seamlessly run this container behind a https scanning proxy
* Skip certificate checks (don't do that)
* Configure time to sleep between synchronization attempts

## Usage

```
$ docker run \
  --rm \
  --env SRC_REPO=source \
  --env DST_REPO=destination \
  --env SLEEP_TIME=30s \
  olegbukatchuk/git-sync:1.0.0
```

*Note*: The container is designed for synchronization over `https` with supported authentication using access tokens.
For example replace `SRC_REPO_TOKEN` with your [GitHub Access token](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line) and `SRC_REPO_TOKEN_USER` with your GitHub user name.

## Environment Variables

| Variable | Description | Mandatory | Example |
| -------- | ----------- | :-------: | ------- |
| `SRC_REPO` | Source repository | Yes | `https://src.com/olegbukatchuk/git-sync.git` |
| `DST_REPO` | Destination repository | Yes | `https://dst.com/olegbukatchuk/git-sync.git` |
| `SRC_LOCAL_REPO` | Local source repository | No, default: Temporary directory | `ExampleProject/FilePath` |
| `DST_LOCAL_REPO` | Local destination repository | No, default: Temporary directory | `ExampleProject/FilePath` |
| `SRC_REPO_TOKEN` | Source repository token | No, default `` | `9a91fa018231aaffbbc1231.....` |
| `DST_REPO_TOKEN` | Destination repository token | No, default `` | `9a91fa018231aaffbbc1231.....` |
| `SRC_REPO_TOKEN_USER` | Source repository token user | No, default `` | `YourGitUser` |
| `DST_REPO_TOKEN_USER` | Destination repository token user | No, default `` | `YourGitUser` |
| `DEBUG` | Print debug output. **WARNING**: This will also print http tokens! | No, default: `false` | `true` or `false` |
| `PRUNE` | Delete branches and tags on DST once they were deleted in SRC | No, default: `false` | `true` or `false` |
| `TWO_WAY` | Mirror both ways. First SRC to DST, then the other way around | No, default: `false` | `true` or `false` |
| `GIT_FORCE_PUSH` | Pushes with git option --force. This makes sense when you sometimes use force push in your git workflow | No, default: `false` | `true` or `false` |
| `HTTP_TLS_VERIFY` | Enable/Disable certificate cheks | No, default: `true` | `true` or `false` |
| `HTTP_SRC_PROXY` | HTTP Proxy to use when connecting to `SRC_REPO` | No, default: `` | `http://localhost:8080` |
| `HTTP_DST_PROXY` | HTTP Proxy to use when connecting to `DST_REPO` | No, default: `` | `http://localhost:8080` |
| `HTTP_ALLOW_TOKENS_INSECURE` | Allow authentication tokens over HTTP. **IMPORTANT**: This is very dangerous. Always use HTTPS! | No, default: `false` | `true` or `false` |
| `ONCE` | If set to `true`, only mirror the repository once | No, default: `false` | `true` or `false` |
| `SLEEP_TIME` | Time to sleep between synchronizations | No, default: `60s` | `30m` |
| `IGNORE_REFS_PATTERN` | Don't mirror matching refs. Ignoring multiple refs is possible by separating them with spaces. | No, default: `refs/pull` | `refs/pull` |
| `TLS_TOFU` | Enable / Disable [TLS-Trust On First Use] | No, default: `false` | `true` or `false` |

[TLS-Trust On First Use]:https://github.com/olegbukatchuk/tls-tofu