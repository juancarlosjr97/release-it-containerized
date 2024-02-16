# Release It - Containerized

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/87c7a4621311406e90d831cb0979e133)](https://app.codacy.com/gh/juancarlosjr97/release-it-containerized?utm_source=github.com&utm_medium=referral&utm_content=juancarlosjr97/release-it-containerized&utm_campaign=Badge_Grade)
[![test](https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml/badge.svg)](https://github.com/juancarlosjr97/release-it-containerized/actions/workflows/test.yaml)
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
| RELEASE_IT_PLUGINS     | List of comma separated release plugins to run                       | false    |
| SSH_PASSPHRASE         | SSH Passphrase associated to the SSH Private Key                     | false    |
| SSH_PRIVATE_KEY        | The SSH Private key associated to the GIT account running release-it | false    |

As the tool runs release-it, you can also pass additional environmental variables, such as `GITHUB_TOKEN` and `GITLAB_TOKEN`, for GitHub and GitLab, respectively.

### Container - Docker

When running from the project, as the directory is passed as a volume to the container, it will inherit the Git configuration set in the project. However, if needed, this configuration can be overridden and set differently.

For example running locally.

```docker
docker run \
    -e GIT_EMAIL="juancarlosjr97@gmail.com" \
    -e GIT_REPOSITORY="git@github.com:juancarlosjr97/release-it-dockerised.git" \
    -e GIT_USERNAME="Juan Carlos Blanco Delgado" \
    -e GITHUB_TOKEN="***" \
    -e GPG_PRIVATE_KEY_ID="***" \
    -e GPG_PRIVATE_KEY="$(cat gpg_private_key.pgp)" \
    -e RELEASE_IT_PLUGINS="@release-it/conventional-changelog@latest,@release-it/bumper@latest" \
    -e SSH_PRIVATE_KEY="$(cat ssh_private_key.sh)" \
    -v $(pwd):/app \
    ghcr.io/juancarlosjr97/release-it-containerized \
    release-it --ci
```

The last line accepts any value, and will be accept any value from release-it CLI configuration. For example, it can execute `--dry-run`.

### GitHub Action

The project provides a [GitHub Action](https://github.com/marketplace/actions/github-action-release-it-containerized) to used within a workflow.

#### Input Variables

| Field              | Description                                               | Required | Default                                        |
| ------------------ | --------------------------------------------------------- | -------- | ---------------------------------------------- |
| command            | Command to execute release-it                             | false    | --ci                                           |
| git_email          | Git email to run release-it                               | false    | `${{ github.actor }}`                          |
| git_username       | Git username to run release-it                            | false    | `${{ github.actor }}@users.noreply.github.com` |
| github_token       | Github Token to run release-it                            | false    | `${{ github.token }}`                          |
| gpg_private_key    | GPG Private Key                                           | false    | ""                                             |
| gpg_private_key_id | GPG Private Key ID                                        | false    | ""                                             |
| image_tag          | Image tag used to pass specific version of the action     | false    | `latest`                                       |
| plugins_list       | List of Plugins to run with release-it as comma separated | false    | ""                                             |
| ssh_private_key    | SSH Private Key                                           | false    | ""                                             |

#### Workflow

Add this step in your workflow file

```yaml
- name: Running release-it using GitHub Action
    uses: juancarlosjr97/release-it-containerized:0.2.0
    with:
        command: "--ci"
        git_email: ${{ vars.GIT_EMAIL }}
        git_username: ${{ vars.GIT_USERNAME }}
        github_token: ${{ secrets.PROJECT_GITHUB_TOKEN }}
        gpg_private_key: ${{ secrets.GPG_PRIVATE_KEY }}
        gpg_private_key_id: ${{ secrets.GPG_PRIVATE_KEY_ID }}
        plugins_list: "@release-it/conventional-changelog@latest,@release-it/bumper@latest"
        ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

#### Example

```yaml
name: Release
on:
  push:
    branches: ["main"]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

- name: Running release-it using GitHub Action
    uses: juancarlosjr97/release-it-containerized:0.2.0
    with:
        command: "--ci"
        git_email: ${{ vars.GIT_EMAIL }}
        git_username: ${{ vars.GIT_USERNAME }}
        github_token: ${{ secrets.PROJECT_GITHUB_TOKEN }}
        gpg_private_key: ${{ secrets.GPG_PRIVATE_KEY }}
        gpg_private_key_id: ${{ secrets.GPG_PRIVATE_KEY_ID }}
        plugins_list: "@release-it/conventional-changelog@latest,@release-it/bumper@latest"
        ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

> [!NOTE]
> GitHub Actions mandates running containers as root to align with GitHub's requirements. Consequently, when executing a GitHub Action involving containerization, it runs with root privileges. For additional details, refer the official documentation from GitHub [here](https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions).

## Acknowledgment

This project is only possible due to the existence of [release-it](https://github.com/release-it/release-it) and all its contributors for the great work.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file.

## Support Information

- [release-it](https://github.com/release-it/release-it)
- [LICENSE](./LICENSE.md)
