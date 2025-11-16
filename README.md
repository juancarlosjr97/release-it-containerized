# Release It - Containerized

[![test](https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml/badge.svg)](https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/0c589ca66383469ea408bcc00308022e)](https://app.codacy.com/gh/juancarlosjr97/release-it-containerized/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
![GitHub Release](https://img.shields.io/github/v/release/juancarlosjr97/release-it-containerized)
[![MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/juancarlosjr97/release-it-containerized/blob/main/LICENSE)

This project is a containerized version of [release-it](https://github.com/release-it/release-it). The purpose of this project is to enable release-it to run in any environment as a standardized container without the need for a Node environment.

This project is simply a wrapper to run as containerization of release-it and execute release-it directly, providing the environment and setup around to run it.

> [!NOTE]
> This project is released using release-it and with this containerized version including pre-releases.

## Usage

As this is a containerized solution, it can be used anywhere!

The most important required is that the project has a valid [configuration](https://github.com/release-it/release-it/blob/main/docs/configuration.md) acceptable by [release-it](https://github.com/release-it/release-it).

### Inputs

The containerized tool accepts the following inputs.

| Environmental Variable | Description                                                          | Required |
| ---------------------- | -------------------------------------------------------------------- | -------- |
| GIT_DIRECTORY          | Directory path to make it safe to run git changes                    | false    |
| GIT_EMAIL              | The Git email that will be identified when running release-it        | false    |
| GIT_REPOSITORY         | The Git repository of the project to run release-it                  | false    |
| GIT_USERNAME           | The Git username that will be identified when running release-it     | false    |
| GPG_PRIVATE_KEY        | The GPG Private Key                                                  | false    |
| GPG_PRIVATE_KEY_ID     | The GPG Private Key ID                                               | false    |
| NPM_VERSION            | Specific NPM version to use. If not specified, uses the default      | false    |
| RELEASE_IT_PLUGINS     | List of comma separated release plugins to run                       | false    |
| SSH_PASSPHRASE         | SSH Passphrase associated to the SSH Private Key                     | false    |
| SSH_PRIVATE_KEY        | The SSH Private key associated to the GIT account running release-it | false    |

As the tool runs release-it, you can also pass additional environmental variables, such as `GITHUB_TOKEN` and `GITLAB_TOKEN`, for GitHub and GitLab, respectively.

### Container - Docker

When running from the project, as the directory is passed as a volume to the container, it will inherit the Git configuration set in the project. However, if needed, this configuration can be overridden and set differently.

For example running locally.

```docker
docker run \
    -e GITHUB_TOKEN="***" \
    -e GIT_EMAIL="juancarlosjr97@gmail.com" \
    -e GIT_REPOSITORY="git@github.com:juancarlosjr97/release-it-containerized.git" \
    -e GIT_USERNAME="Juan Carlos Blanco Delgado" \
    -e GPG_PRIVATE_KEY="$(cat gpg_private_key.pgp)" \
    -e GPG_PRIVATE_KEY_ID="***" \
    -e NPM_VERSION="10.8.0" \
    -e RELEASE_IT_PLUGINS="@release-it/conventional-changelog@latest,@release-it/bumper@latest" \
    -e SSH_PASSPHRASE="***" \
    -e SSH_PRIVATE_KEY="$(cat ssh_private_key)" \
    -v $(pwd):/app \
    ghcr.io/juancarlosjr97/release-it-containerized \
    release-it --ci
```

The last line accepts any value, and will be accept any value from release-it CLI configuration. For example, it can execute `--dry-run`.

### GitHub Action

The project provides a [GitHub Action](https://github.com/marketplace/actions/github-action-release-it-containerized) to used within a workflow.

#### GitHub Token Requirement

> [!IMPORTANT]
> The `github_token` input is **required** and must be explicitly provided by the caller workflow. The action does not use `${{ github.token }}` internally to ensure it can be reused across different repositories.

**Why is this required?**

When using this action from another repository, the default `${{ github.token }}` from the caller's context may not have the necessary permissions to:
- Create tags and releases in the target repository
- Push commits to the target repository
- Trigger subsequent workflows

**Token Options:**

1. **Same Repository**: Use `${{ secrets.GITHUB_TOKEN }}` if running within the same repository and default permissions are sufficient.
2. **Cross-Repository or Enhanced Permissions**: Create a Personal Access Token (PAT) or use a GitHub App token with appropriate permissions:
   - `contents: write` - for creating commits and tags
   - `pull-requests: write` - if managing pull requests
   - `workflows: write` - if triggering other workflows

Store the token as a repository secret and reference it in your workflow.

#### Input Variables

| Field              | Description                                               | Required | Default                                        |
| ------------------ | --------------------------------------------------------- | -------- | ---------------------------------------------- |
| command            | Command to execute release-it                             | false    | ""                                             |
| git_email          | Git email to run release-it                               | false    | `${{ github.actor }}`                          |
| git_username       | Git username to run release-it                            | false    | `${{ github.actor }}@users.noreply.github.com` |
| github_token       | GitHub Token to run release-it                            | **true** | -                                              |
| gpg_private_key    | GPG Private Key                                           | false    | ""                                             |
| gpg_private_key_id | GPG Private Key ID                                        | false    | ""                                             |
| image_tag          | Image tag used to pass specific version of the action     | false    | `latest`                                       |
| npm_version        | NPM version to use. If not specified, uses the default    | false    | ""                                             |
| plugins_list       | List of Plugins to run with release-it as comma separated | false    | ""                                             |
| ssh_passphrase     | SSH Passphrase                                            | false    | ""                                             |
| ssh_private_key    | SSH Private Key                                           | false    | ""                                             |
| version            | Release It version                                        | false    | `latest`                                       |

The GitHub Action exclusively operates within a CI environment, utilizing the `--ci` option, ensuring a fully automated process devoid of prompts in a non-interactive mode.

#### Workflow

Add this step in your workflow file

```yaml
- name: Running release-it using GitHub Action
  uses: juancarlosjr97/release-it-containerized:0.2.0
  with:
    # Required: Provide an explicit token
    github_token: ${{ secrets.GITHUB_TOKEN }} # or use a custom PAT: ${{ secrets.RELEASE_TOKEN }}
    git_email: ${{ vars.GIT_EMAIL }}
    git_username: ${{ vars.GIT_USERNAME }}
    gpg_private_key: ${{ secrets.GPG_PRIVATE_KEY }}
    gpg_private_key_id: ${{ secrets.GPG_PRIVATE_KEY_ID }}
    npm_version: "10.8.0"
    plugins_list: "@release-it/conventional-changelog@latest,@release-it/bumper@latest"
    ssh_passphrase: ${{ secrets.SSH_PASSPHRASE }}
    ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

#### Example

```yaml
name: Release
on:
  push:
    branches: ["main"]

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Running release-it using GitHub Action
        uses: juancarlosjr97/release-it-containerized:0.2.0
        with:
          # Required: Provide an explicit token
          github_token: ${{ secrets.GITHUB_TOKEN }} # or use a custom PAT: ${{ secrets.RELEASE_TOKEN }}
          git_email: ${{ vars.GIT_EMAIL }}
          git_username: ${{ vars.GIT_USERNAME }}
          gpg_private_key: ${{ secrets.GPG_PRIVATE_KEY }}
          gpg_private_key_id: ${{ secrets.GPG_PRIVATE_KEY_ID }}
          npm_version: "10.8.0"
          plugins_list: "@release-it/conventional-changelog@latest,@release-it/bumper@latest"
          ssh_passphrase: ${{ secrets.SSH_PASSPHRASE }}
          ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

#### Cross-Repository Usage Example

When using this action from a different repository (e.g., from `org/repo-a` to release in `org/repo-b`), you'll need a token with appropriate permissions for the target repository:

```yaml
name: Release in Another Repo
on:
  workflow_dispatch:

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout target repository
        uses: actions/checkout@v4
        with:
          repository: org/repo-b  # Target repository
          token: ${{ secrets.RELEASE_TOKEN_FOR_REPO_B }}  # PAT with access to repo-b
          fetch-depth: 0

      - name: Running release-it using GitHub Action
        uses: juancarlosjr97/release-it-containerized:0.2.0
        with:
          # Use the same token that has write access to the target repository
          github_token: ${{ secrets.RELEASE_TOKEN_FOR_REPO_B }}
          git_email: release-bot@example.com
          git_username: Release Bot
          plugins_list: "@release-it/conventional-changelog@latest"
```

> [!NOTE]
> When using this action across repositories, ensure your token (`RELEASE_TOKEN_FOR_REPO_B` in the example above) has the following permissions for the target repository:
> - `contents: write` - to create commits, tags, and releases
> - `workflows: write` - if you need to trigger workflows after release

> [!NOTE]
> GitHub Actions mandates running containers as root to align with GitHub's requirements. Consequently, when executing a GitHub Action involving containerization, it runs with root privileges. For additional details, refer the official documentation from GitHub [here](https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions).

> [!NOTE]
> All Docker operations in the GitHub Actions workflows include automatic retry functionality to handle transient network failures, Docker registry unavailability, or other random failures. Operations are retried up to 3 times with exponential backoff delays.

## Acknowledgment

This project is only possible due to the existence of [release-it](https://github.com/release-it/release-it) and all its contributors for the great work.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file.

## Support Information

- [release-it](https://github.com/release-it/release-it)
- [LICENSE](./LICENSE.md)
