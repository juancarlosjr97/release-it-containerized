# Release It - Containerized

Release It - Containerized is a Docker-based wrapper for the [release-it](https://github.com/release-it/release-it) tool that enables automated releases in any environment without requiring a local Node.js setup. The project provides both Docker CLI usage and GitHub Action integration.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Prerequisites and Setup
- Docker must be installed and available in your environment
- For building: Alpine package repositories must be accessible (network connectivity required)
- For GitHub Action usage: Repository must have valid release-it configuration

### Build and Test Process
- **CRITICAL**: Docker builds require internet access to Alpine repositories and may fail in network-restricted environments
- **BUILD TIME**: Docker build takes approximately 2-3 minutes when Alpine repositories are accessible. NEVER CANCEL - set timeout to 5+ minutes
- **CONTAINER STARTUP**: Each container run takes 60-80 seconds because it installs release-it and plugins dynamically. NEVER CANCEL - set timeout to 120+ seconds

#### Build Commands
- Build container: `docker build --tag release-it-containerized:test .`
- **NETWORK LIMITATION**: If build fails with "Permission denied" for Alpine repositories, this is a known network connectivity issue. Document as "Build fails due to network restrictions preventing Alpine package installation"

#### Test Commands  
- Test published image: `docker pull ghcr.io/juancarlosjr97/release-it-containerized:latest` - Works reliably
- **VALIDATION LIMITATION**: Direct container testing may fail due to npm installation issues in restricted environments
- **WORKAROUND**: Test via GitHub Action workflows instead of direct Docker commands
- **TEST APPROACH**: Use `.github/workflows/local-test-workflow.yaml` as the primary validation method
- **TIMING**: Each container run attempts npm install for 60-80 seconds before failing. NEVER CANCEL - set timeout to 120+ seconds

### Validation Scenarios
- **PRIMARY VALIDATION**: Use GitHub workflows for testing instead of direct Docker commands
- **GitHub Action Test**: Validate action.yaml syntax and workflow execution via `.github/workflows/local-test-workflow.yaml`
- **Entrypoint Script Test**: Verify release-it-entrypoint.sh handles all environment variables correctly
- **Version Bumping Test**: Confirm .release-it.js configuration works with VERSION file updates
- **LIMITATION**: Direct container testing may fail due to npm network connectivity issues - this is expected in restricted environments

### Key Environment Variables
The container accepts these environment variables:
- `GIT_DIRECTORY`: Directory path for Git operations (typically "/app")
- `GIT_EMAIL`: Git email for commits
- `GIT_USERNAME`: Git username for commits  
- `GPG_PRIVATE_KEY`: GPG private key for signing
- `GPG_PRIVATE_KEY_ID`: GPG key ID for signing
- `RELEASE_IT_PLUGINS`: Comma-separated list of plugins (e.g., "@release-it/conventional-changelog@latest,@release-it/bumper@latest")
- `SSH_PRIVATE_KEY`: SSH private key for Git authentication
- `SSH_PASSPHRASE`: SSH passphrase
- `GITHUB_TOKEN`: GitHub token for API access

### GitHub Workflows
- **Test Workflow**: `.github/workflows/test.yaml` - Runs comprehensive tests with multiple scenarios
- **Package Workflow**: `.github/workflows/package.yaml` - Builds and publishes container on release
- **Local Test Workflow**: `.github/workflows/local-test-workflow.yaml` - Reusable workflow with detailed testing
- **Workflow Runtime**: Test workflows take 5-10 minutes. NEVER CANCEL - set timeout to 15+ minutes

## Repository Structure

### Key Files
- `Dockerfile`: Alpine-based Node.js container with release-it dependencies
- `action.yaml`: GitHub Action definition with comprehensive input parameters
- `release-it-entrypoint.sh`: Setup script handling Git, GPG, SSH configuration and npm installation
- `.release-it.js`: Release-it configuration with conventional changelog and version bumping
- `VERSION`: Text file containing current version (managed by @release-it/bumper plugin)

### Important Locations
- **Container Entrypoint**: `/usr/local/bin/release-it-containerized` (copied from release-it-entrypoint.sh)
- **Working Directory**: `/app` (where repository is mounted)
- **NPM Global Directory**: `/home/node/.npm-global` (configured in entrypoint script)

## Common Tasks

### Building Changes
- Modify Dockerfile, action.yaml, or entrypoint script as needed
- **DO NOT** modify Alpine package versions without testing connectivity
- Always test changes with the published image first: `ghcr.io/juancarlosjr97/release-it-containerized:latest`

### Testing Changes
- Use GitHub workflows for reliable testing: `.github/workflows/test.yaml`
- Validate syntax before committing:
  - Entrypoint script: `bash -n release-it-entrypoint.sh`
  - Release-it config: `node -c .release-it.js`  
  - GitHub Action: `yq eval '.runs.steps[0].run' action.yaml` (if yq available)
- **DO NOT** rely on direct Docker execution for validation in restricted environments
- Always test changes with actual workflow execution

### AI-Created Pull Requests
- **REQUIRED**: All pull requests created and edited by AI agents must be labeled for identification
- Apply appropriate labels to distinguish AI-created PRs from human-created ones
- This helps with tracking, review processes, and repository management
- Use labels such as `ai-generated`, `copilot`, or similar to mark AI contributions

### Release Process
- Version is managed in `VERSION` file and updated by release-it
- Conventional commits are used for changelog generation
- Container is automatically built and published on release via `.github/workflows/package.yaml`

## Limitations and Workarounds

### Network Connectivity
- **LIMITATION**: Alpine package repository access may be blocked in some environments
- **WORKAROUND**: Use pre-built published image `ghcr.io/juancarlosjr97/release-it-containerized:latest` for testing
- **DOCUMENTATION**: Always document network limitations when encountered

### Container Performance
- **LIMITATION**: Each container run installs release-it and plugins dynamically (60-80 seconds)
- **EXPECTED BEHAVIOR**: This is by design for flexibility but impacts performance
- **NETWORK DEPENDENCY**: npm installation may fail in network-restricted environments
- **NO WORKAROUND**: Installation time is normal and expected when successful

### Build Dependencies
- **LIMITATION**: Requires specific Alpine package versions that may become unavailable
- **WORKAROUND**: Remove version pinning temporarily for testing if needed
- **RESTORE**: Always restore original Dockerfile after testing

## Quick Reference Commands

### Essential Commands
```bash
# Pull latest published image (WORKS)
docker pull ghcr.io/juancarlosjr97/release-it-containerized:latest

# Validate GitHub Action syntax (RECOMMENDED APPROACH)
yq eval '.runs.steps[0].run' action.yaml

# Direct container testing (MAY FAIL in restricted environments)
# Use workflows instead for reliable testing
docker run --rm -v $(pwd):/app ghcr.io/juancarlosjr97/release-it-containerized:latest release-it --dry-run --ci
```

### Reliable Testing Commands
```bash
# Test via GitHub workflow (RECOMMENDED)
# Push changes and observe workflow execution in .github/workflows/test.yaml

# Validate entrypoint script syntax
bash -n release-it-entrypoint.sh

# Check .release-it.js configuration syntax  
node -c .release-it.js
```

### Repository Structure Output
```
ls -la [repo-root]
.github/
├── CODEOWNERS
└── workflows/
    ├── local-test-workflow.yaml
    ├── package.yaml
    ├── release.yaml
    ├── schedule.yaml
    └── test.yaml
.gitignore
.release-it.js
CHANGELOG.md
CODE_OF_CONDUCT.md
Dockerfile
LICENSE
README.md
VERSION
action.yaml
release-it-entrypoint.sh
renovate.json
```