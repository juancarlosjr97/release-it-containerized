# Release It - Containerized

[![test](https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml/badge.svg)](https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/0c589ca66383469ea408bcc00308022e)](https://app.codacy.com/gh/juancarlosjr97/release-it-containerized/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
![GitHub Release](https://img.shields.io/github/v/release/juancarlosjr97/release-it-containerized)
[![MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/juancarlosjr97/release-it-containerized/blob/main/LICENSE)

A containerized version of [release-it](https://github.com/release-it/release-it) that runs in any environment without requiring a Node.js installation. This project is a wrapper providing the environment and setup to execute release-it directly from a container.

> [!NOTE]
> This project is released using release-it and this containerized version, including pre-releases.

## How It Works

At runtime the container:

1. Configures Git (user, email, remote URL, safe directory)
2. Imports GPG key and enables signed commits (if provided)
3. Configures SSH key and starts the SSH agent (if provided)
4. Installs the requested NPM and release-it version (defaults to `latest`)
5. Installs any additional release-it plugins from `RELEASE_IT_PLUGINS`
6. Executes `release-it` with the arguments passed to the container

The project must include a valid [release-it configuration](https://github.com/release-it/release-it/blob/main/docs/configuration.md) file.

## Quick Start

### Docker

```bash
docker run \
    -e GITHUB_TOKEN="<token>" \
    -e GIT_EMAIL="you@example.com" \
    -e GIT_USERNAME="Your Name" \
    -v $(pwd):/app \
    ghcr.io/juancarlosjr97/release-it-containerized \
    release-it --ci
```

### GitHub Action

```yaml
- name: Release
  uses: juancarlosjr97/release-it-containerized@1.0.12
  with:
    github_token: ${{ secrets.RELEASE_IT_GITHUB_TOKEN }}
```

> [!IMPORTANT]
> A Personal Access Token (PAT) with `contents: write` must be stored as a repository secret and passed as `github_token`. The default `${{ github.token }}` is not supported.

## Documentation

- [Usage](./docs/USAGE.md) — full input reference, Docker examples, and GitHub Action setup

## Acknowledgment

This project is only possible due to the existence of [release-it](https://github.com/release-it/release-it) and all its contributors for the great work.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file.

## Support Information

- [release-it](https://github.com/release-it/release-it)
- [LICENSE](./LICENSE.md)
