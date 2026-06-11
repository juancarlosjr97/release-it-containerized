# Fixing a Missing Release

Use this runbook when a release is missing one or more of the following:

- A versioned Docker image tag on GHCR (e.g. `2.1.43`)
- The `latest` Docker image tag on GHCR
- A GitHub Release entry

> **Scope:** This runbook covers recreating Docker image tags and the GitHub Release entry. It assumes the Git tag for the version either already exists or will be created implicitly by `gh release create --target`.

---

## Prerequisites

- Docker installed and running locally
- `gh` CLI authenticated (`gh auth status`)
- A GitHub PAT with `write:packages` and `repo` scopes stored as `GITHUB_TOKEN`
- Snyk CLI installed and authenticated with `SNYK_TOKEN`
- Your GitHub username (referred to as `<GITHUB_USERNAME>` in commands below)

> **Note:** The same `GITHUB_TOKEN` PAT is used for both GHCR authentication and `gh` CLI operations. Ensure `gh` uses this token by running `gh auth login --with-token <<< "$GITHUB_TOKEN"` or by having it already configured.

---

## Step 1 — Checkout the target commit

Ensure you are on the exact commit that should be released:

```bash
git checkout <COMMIT_SHA>
```

---

## Step 2 — Build the image locally

```bash
docker build -t release-it-containerized:dev .
```

---

## Step 3 — Verify the vulnerability baseline

Before pushing, the image **must** pass a vulnerability scan. This step is a mandatory gate — do not proceed if vulnerabilities are found.

```bash
export SNYK_IMAGE=release-it-containerized:dev
snyk container test "$SNYK_IMAGE" --file=Dockerfile --severity-threshold=low --exclude-app-vulns
```

If the command exits with code `1`, the image has vulnerabilities and **must not** be pushed. Resolve the vulnerabilities before continuing.

---

## Step 4 — Authenticate with GHCR

```bash
echo "$GITHUB_TOKEN" | docker login ghcr.io -u <GITHUB_USERNAME> --password-stdin
```

---

## Step 5 — Tag and push the versioned image

Replace `<VERSION>` with the release version (e.g. `2.1.43`):

```bash
docker tag release-it-containerized:dev ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>
docker push ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>
```

---

## Step 6 — Tag and push `latest`

```bash
docker tag release-it-containerized:dev ghcr.io/juancarlosjr97/release-it-containerized:latest
docker push ghcr.io/juancarlosjr97/release-it-containerized:latest
```

---

## Step 7 — Create the GitHub Release

Pin the release to the exact commit using `--target`. This also creates the Git tag if it does not already exist:

```bash
gh release create <VERSION> \
  --repo juancarlosjr97/release-it-containerized \
  --target <COMMIT_SHA> \
  --title "<VERSION>" \
  --notes "<CHANGELOG_CONTENT>"
```

`<COMMIT_SHA>` is the full SHA of the commit the release corresponds to (e.g. from `git log --oneline`).

`<CHANGELOG_CONTENT>` should be the relevant section from `CHANGELOG.md` for this version.

Example:

```bash
gh release create 2.1.43 \
  --repo juancarlosjr97/release-it-containerized \
  --target abc1234def5678 \
  --title "2.1.43" \
  --notes "## [2.1.43](https://github.com/juancarlosjr97/release-it-containerized/compare/2.1.42...2.1.43) (2026-05-05)

### Bug Fixes

* revert actions/checkout to v5.0.1 and restrict Renovate to v5.x ([#302](https://github.com/juancarlosjr97/release-it-containerized/issues/302))"
```

---

## Verification

After completing the steps above, confirm everything is in place:

```bash
# Verify versioned tag exists
docker pull ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>

# Verify latest points to the right image
docker pull ghcr.io/juancarlosjr97/release-it-containerized:latest

# Verify GitHub Release exists
gh release view <VERSION> --repo juancarlosjr97/release-it-containerized
```
