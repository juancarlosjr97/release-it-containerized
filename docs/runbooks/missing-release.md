# Runbook: Fixing a Missing Release

Use this runbook when a release is missing one or more of the following:

- A versioned Docker image tag on GHCR (e.g. `2.1.43`)
- The `latest` Docker image tag on GHCR
- A GitHub Release entry

---

## Prerequisites

- Docker installed and running locally
- `gh` CLI authenticated (`gh auth status`)
- A GitHub PAT with `write:packages` and `repo` scopes stored as `GITHUB_TOKEN`

---

## Step 1 — Verify the vulnerability baseline (optional)

Before pushing, confirm the image is clean:

```bash
export TRIVY_IMAGE=release-it-containerized:dev
trivy image $TRIVY_IMAGE
```

Or scan a specific published version:

```bash
export TRIVY_IMAGE=ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>
trivy image $TRIVY_IMAGE
```

---

## Step 2 — Build the image locally

```bash
docker build -t release-it-containerized .
```

---

## Step 3 — Authenticate with GHCR

```bash
echo "$GITHUB_TOKEN" | docker login ghcr.io -u <GITHUB_USERNAME> --password-stdin
```

---

## Step 4 — Tag and push the versioned image

Replace `<VERSION>` with the release version (e.g. `2.1.43`):

```bash
docker tag release-it-containerized ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>
docker push ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>
```

---

## Step 5 — Tag and push `latest`

```bash
docker pull ghcr.io/juancarlosjr97/release-it-containerized:<VERSION>
docker tag ghcr.io/juancarlosjr97/release-it-containerized:<VERSION> ghcr.io/juancarlosjr97/release-it-containerized:latest
docker push ghcr.io/juancarlosjr97/release-it-containerized:latest
```

---

## Step 6 — Create the GitHub Release

```bash
gh release create <VERSION> \
  --repo juancarlosjr97/release-it-containerized \
  --title "<VERSION>" \
  --notes "<CHANGELOG_CONTENT>"
```

`<CHANGELOG_CONTENT>` should be the relevant section from `CHANGELOG.md` for this version.

Example:

```bash
gh release create 2.1.43 \
  --repo juancarlosjr97/release-it-containerized \
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
