# Copilot Instructions for Release It - Containerized

## Project Overview

This project is a containerized version of [release-it](https://github.com/release-it/release-it). It packages release-it into a Docker image based on Alpine Linux + Node.js, allowing release-it to run in any environment without a local Node.js installation. It is also published as a GitHub Action.

## Tech Stack

- **Container**: Docker (Alpine Linux + Node.js base image)
- **Package Manager**: Alpine APK for system packages, NPM for Node.js packages
- **Entrypoint**: Bash shell script (`release-it-entrypoint.sh`)
- **GitHub Action**: Defined in `action.yaml`
- **Release Automation**: release-it with `@release-it/conventional-changelog` and `@release-it/bumper` plugins
- **Dependency Management**: Renovate bot (`renovate.json`)
- **CI/CD**: GitHub Actions workflows in `.github/workflows/`

## Project Structure

```
.
├── Dockerfile                # Main Docker image definition (Alpine + Node.js)
├── release-it-entrypoint.sh # Container entrypoint bash script
├── action.yaml              # GitHub Action definition
├── .release-it.js           # Release-it configuration (conventional changelog + bumper)
├── renovate.json            # Renovate dependency update configuration
├── VERSION                  # Plain text file holding the current version
├── CHANGELOG.md             # Auto-generated changelog (do not edit manually)
├── README.md                # Project documentation
├── CONTRIBUTING.md          # Contribution guidelines
├── CODE_OF_CONDUCT.md       # Code of conduct
├── LICENSE                  # MIT License
└── .github/
    ├── CODEOWNERS           # Code ownership definitions
    ├── copilot-instructions.md  # This file
    ├── agents/              # Copilot agent definitions
    └── workflows/           # GitHub Actions workflows
        ├── local-test-workflow.yaml  # Reusable test workflow
        ├── package.yaml              # Docker image packaging/publishing
        ├── release.yaml              # Release automation (triggered after Test)
        ├── schedule.yaml             # Scheduled periodic test runs
        └── test.yaml                 # CI test workflow (triggered on push)
```

## Commit Message Conventions

All commits **must** follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

#<issue-number>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting (no logic change)
- `refactor`: Code restructuring (no feature/bug change)
- `perf`: Performance improvements
- `test`: Adding or fixing tests
- `build`: Build system or dependency changes
- `ci`: CI configuration changes
- `chore`: Maintenance tasks
- `revert`: Reverts a previous commit

### Scopes (optional)

- `deps`: Dependency updates
- `docker`: Docker-related changes
- `config`: Configuration changes

### Rules

- Use imperative present tense: "add support" not "added support"
- No capital first letter in subject
- No period at the end of subject
- Always include the issue number reference on a new line after the subject

### Examples

```
feat: add support for specifying NPM version

#24

fix: update openssh to v9.9_p2-r0

#132

chore(deps): update node.js to v24.11.1

#201
```

## Development Guidelines

### Dockerfile

- Always pin package versions using `ENV` variables with the `# renovate:` annotation so Renovate can update them automatically
- Use the `# renovate: datasource=repology depName=alpine_3_23/<package> versioning=loose` comment format before each `ENV` declaration — update `alpine_3_23` to match the Alpine version in the base image tag when the base image changes
- Keep the Node.js base image pinned by both tag and digest (SHA256)
- Packages are installed using `apk add --no-cache` with pinned versions

### Entrypoint Script (`release-it-entrypoint.sh`)

- Written in bash with `set -e` for strict error handling
- All environment variables are initialized with default empty values at the top
- Each feature (git config, GPG, SSH, NPM, plugins) is handled in its own conditional block
- Use `shellcheck` guidelines; add `# shellcheck disable=...` comments only when necessary with explanation

### GitHub Actions Workflows

- Pin all third-party actions to a specific commit SHA with a comment indicating the version (e.g., `uses: actions/checkout@<sha> # v5.0.1`)
- Use `nick-fields/retry` for Docker operations to handle transient failures (up to 3 attempts with exponential backoff)
- Reuse the `local-test-workflow.yaml` for tests across different triggers
- Use `workflow_run` to trigger the release workflow after tests pass

### action.yaml

- Use `docker://ghcr.io/juancarlosjr97/release-it-containerized:<image_tag>` as the action runner
- Default values for inputs should match the GitHub Action context (e.g., `${{ github.actor }}`)

## Testing

### Local Testing

```bash
# Build the image
docker build -t release-it-containerized:dev .

# Run with --dry-run to test without making actual changes
docker run \
    -e GITHUB_TOKEN="your_token" \
    -e GIT_EMAIL="your@email.com" \
    -e GIT_USERNAME="Your Name" \
    -e RELEASE_IT_PLUGINS="@release-it/conventional-changelog@latest,@release-it/bumper@latest" \
    -v $(pwd):/app \
    release-it-containerized:dev \
    release-it --dry-run --ci
```

### CI Testing

Tests run through `.github/workflows/test.yaml` → `.github/workflows/local-test-workflow.yaml`. The test workflow:
1. Builds the Docker image
2. Runs security scan on the built image
3. Runs release-it with `--dry-run --ci` in multiple configurations (no keys, GPG only, GPG+SSH)
4. Tests the GitHub Action directly using `uses: ./`
5. Tests with a specific NPM version

## Release Process

Releases are automated:
1. Push to `main` triggers the Test workflow
2. If tests pass, the Release workflow runs automatically
3. Release uses release-it with conventional changelog to generate the `CHANGELOG.md` and tag the release
4. Pre-releases (beta) are created from the `develop` branch

## Environment Variables

Key environment variables used by the container:

| Variable | Description |
|---|---|
| `GIT_DIRECTORY` | Directory path to mark as git-safe |
| `GIT_EMAIL` | Git commit author email |
| `GIT_REPOSITORY` | Git remote repository URL (for SSH) |
| `GIT_USERNAME` | Git commit author username |
| `GPG_PRIVATE_KEY` | GPG private key content (PGP armored) |
| `GPG_PRIVATE_KEY_ID` | GPG key ID for signing |
| `NPM_VERSION` | Specific NPM version to install |
| `RELEASE_IT_PLUGINS` | Comma-separated list of release-it plugins |
| `RELEASE_IT_VERSION` | release-it version to install (default: `latest`) |
| `SSH_PASSPHRASE` | Passphrase for SSH private key |
| `SSH_PRIVATE_KEY` | SSH private key content |
