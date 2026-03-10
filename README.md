# Release It - Containerized

[![test][1]][2]
[![Codacy Badge][3]][4]
![GitHub Release][5]
[![MIT][6]][7]

A containerized version of [release-it][8] that runs in any environment without requiring a Node.js installation. This project is a wrapper providing the environment and setup to execute release-it directly from a container.

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

The project must include a valid [release-it configuration][9] file.

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

- [Usage][10] — full input reference, Docker examples, and GitHub Action setup

## Acknowledgment

This project is only possible due to the existence of [release-it][8] and all its contributors for the great work.

## License

This project is licensed under the MIT License. See the [LICENSE][7] file.

## Support Information

- [release-it][8]
- [LICENSE][7]

[1]: https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml/badge.svg
[2]: https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml
[3]: https://app.codacy.com/project/badge/Grade/0c589ca66383469ea408bcc00308022e
[4]: https://app.codacy.com/gh/juancarlosjr97/release-it-containerized/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade
[5]: https://img.shields.io/github/v/release/juancarlosjr97/release-it-containerized
[6]: https://img.shields.io/badge/License-MIT-brightgreen.svg
[7]: ./LICENSE
[8]: https://github.com/release-it/release-it
[9]: https://github.com/release-it/release-it/blob/main/docs/configuration.md
[10]: ./docs/USAGE.md
