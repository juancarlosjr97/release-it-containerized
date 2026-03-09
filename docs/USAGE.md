# Usage

The project must have a valid [release-it configuration](https://github.com/release-it/release-it/blob/main/docs/configuration.md) file. As a containerized solution it can run anywhere — locally via Docker or in CI via the GitHub Action.

## Inputs

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

## Container - Docker

When running from the project, as the directory is passed as a volume to the container, it will inherit the Git configuration set in the project. However, if needed, this configuration can be overridden and set differently.

For example running locally:

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

The last line accepts any value, and will accept any value from release-it CLI configuration. For example, it can execute `--dry-run`.

## GitHub Action

The project provides a [GitHub Action](https://github.com/marketplace/actions/github-action-release-it-containerized) to use within a workflow. The action always runs with `--ci`, so no interactive prompts are triggered.

### GitHub Token Requirement

> [!IMPORTANT]
> The `github_token` input is **required** and must be explicitly provided by the caller workflow. The default `${{ github.token }}` is not supported — it may lack permissions to create tags and releases, push commits, or trigger subsequent workflows.

Create a Personal Access Token (PAT) with `contents: write` (Read and Write access to repository contents, commits, branches, downloads, releases, and merges — see [Contents permission](https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens?apiVersion=2022-11-28#repository-permissions-for-contents)), store it as a repository secret, and pass it to the action. Use a name such as `RELEASE_IT_GITHUB_TOKEN` — secrets cannot start with `GITHUB_`.

### Input Variables

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

### Workflow Step

Add this step in your workflow file. Update the tag version of the action and the `plugins_list` to what is needed for the project.

```yaml
- name: Running release-it Containerized
  uses: juancarlosjr97/release-it-containerized:1.0.12
  with:
    git_email: ${{ vars.GIT_EMAIL }}
    git_username: ${{ vars.GIT_USERNAME }}
    github_token: ${{ secrets.RELEASE_IT_GITHUB_TOKEN }}
    gpg_private_key_id: ${{ secrets.GPG_PRIVATE_KEY_ID }}
    gpg_private_key: ${{ secrets.GPG_PRIVATE_KEY }}
    plugins_list: "@release-it/conventional-changelog,@release-it/bumper"
    ssh_passphrase: ${{ secrets.SSH_PASSPHRASE }}
    ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

### Examples

**Basic — PAT used only for the release step:**

```yaml
---
name: Release
on:
  push:
    branches:
      - main

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        # Note: actions/checkout@v6 breaks git authentication inside Docker containers — see https://github.com/juancarlosjr97/release-it-containerized/issues/212
        uses: actions/checkout@08c6903cd8c0fde910a37f88322edcfb5dd907a8 # v5
        with:
          fetch-depth: 0

      - name: Running release-it using GitHub Action
        uses: juancarlosjr97/release-it-containerized:1.0.12
        with:
          git_email: ${{ vars.GIT_EMAIL }}
          git_username: ${{ vars.GIT_USERNAME }}
          github_token: ${{ secrets.RELEASE_IT_GITHUB_TOKEN }}
          gpg_private_key_id: ${{ secrets.GPG_PRIVATE_KEY_ID }}
          gpg_private_key: ${{ secrets.GPG_PRIVATE_KEY }}
          npm_version: "10.8.0"
          plugins_list: "@release-it/conventional-changelog@latest,@release-it/bumper@latest"
          ssh_passphrase: ${{ secrets.SSH_PASSPHRASE }}
          ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

**With PAT passed to checkout — required when release-it pushes commits back to the repository:**

```yaml
---
name: Release
on:
  push:
    branches:
      - main

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        # Note: actions/checkout@v6 breaks git authentication inside Docker containers — see https://github.com/juancarlosjr97/release-it-containerized/issues/212
        uses: actions/checkout@08c6903cd8c0fde910a37f88322edcfb5dd907a8 # v5
        with:
          token: ${{ secrets.RELEASE_IT_GITHUB_TOKEN }}
          fetch-depth: 0

      - name: Running release-it using GitHub Action
        uses: juancarlosjr97/release-it-containerized@1.0.12
        with:
          github_token: ${{ secrets.RELEASE_IT_GITHUB_TOKEN }}
          plugins_list: "@release-it/conventional-changelog"
```

### Considerations

- **Root execution:** GitHub Actions mandates running containers as root. See the [GitHub documentation](https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions) for details.
- **Automatic retries:** All Docker operations include retry logic (up to 3 attempts with exponential backoff) to handle transient network or registry failures.
