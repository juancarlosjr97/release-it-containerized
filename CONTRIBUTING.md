# Contributing to Release It - Containerized

Thank you for your interest in contributing to this project! We appreciate your time and effort to help improve Release It - Containerized.

## Code of Conduct

This project adheres to a [Code of Conduct](./CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to juancarlosjr97@gmail.com.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title** for the issue
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples** to demonstrate the steps
- **Describe the behavior you observed** and what you expected to see
- **Include details about your environment** (OS, Docker version, etc.)
- **Add screenshots or logs** if applicable

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description** of the suggested enhancement
- **Explain why this enhancement would be useful** to most users
- **List any alternatives** you've considered

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Follow the commit message conventions** (see below)
3. **Ensure your code follows the existing style**
4. **Test your changes thoroughly**
5. **Update documentation** as needed
6. **Submit a pull request** with a clear description of your changes

## Development Workflow

### Prerequisites

- Docker
- Git
- Basic understanding of containerization and release-it

### Setting Up Development Environment

1. Fork and clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/release-it-containerized.git
   cd release-it-containerized
   ```

2. Build the Docker image locally:
   ```bash
   docker build -t release-it-containerized:dev .
   ```

3. Test your changes:
   ```bash
   docker run \
       -e GITHUB_TOKEN="your_token" \
       -v $(pwd):/app \
       release-it-containerized:dev \
       --dry-run
   ```

### Making Changes

1. **Create a new branch** for your feature or fix:
   ```bash
   git checkout -b feat/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

2. **Make your changes** following the project conventions

3. **Test your changes** thoroughly

4. **Commit your changes** using conventional commits (see below)

## Commit Message Guidelines

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification. This leads to more readable messages that are easy to follow when looking through the project history.

### Commit Message Format

Each commit message consists of a **type**, an optional **scope**, and a **subject**:

```
<type>(<scope>): <subject>
```

#### Type

Must be one of the following:

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (formatting, etc.)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

#### Scope

The scope is optional and should be a noun describing a section of the codebase. Examples:

- **deps**: Dependency updates
- **docker**: Docker-related changes
- **config**: Configuration changes

#### Subject

The subject contains a succinct description of the change:

- Use the imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
- No period (.) at the end

#### Issue Reference

**All commits must include a reference to the related issue number** in the commit message body. Add the issue reference on a new line after the subject:

```
<type>(<scope>): <subject>

#<issue-number>
```

#### Examples

```
feat: add support for specifying NPM version

#24

fix: update openssh to v9.9_p2-r0

#132

docs: add contributing guidelines

#15

chore(deps): update node.js to v24.11.1

#201

ci: update tests on gh to use ci flag

#114
```

## Pull Request Process

1. **Update documentation** if you're changing functionality
2. **Ensure all tests pass** and the Docker image builds successfully
3. **Follow the commit message conventions**
4. **Write a clear PR description** explaining:
   - What changes you made
   - Why you made them
   - How to test them
5. **Link related issues** using keywords like "Closes #123" or "Fixes #456"
6. **Be responsive to feedback** from maintainers

### PR Title Format

PR titles should also follow the conventional commits format:

```
feat: add new feature
fix: resolve bug in entrypoint script
docs: update README with new examples
```

## Project Structure

```
.
├── Dockerfile                # Main Docker image definition
├── release-it-entrypoint.sh # Entrypoint script for the container
├── action.yaml              # GitHub Action configuration
├── .release-it.js           # Release-it configuration
├── CHANGELOG.md             # Auto-generated changelog
├── README.md                # Project documentation
├── CODE_OF_CONDUCT.md       # Code of conduct
├── CONTRIBUTING.md          # This file
└── LICENSE                  # MIT License
```

## Testing

### Local Testing

Test your changes locally using Docker:

```bash
# Build the image
docker build -t release-it-containerized:test .

# Run with dry-run to test without making changes
docker run \
    -e GITHUB_TOKEN="your_token" \
    -e GIT_EMAIL="your@email.com" \
    -e GIT_USERNAME="Your Name" \
    -v $(pwd):/app \
    release-it-containerized:test \
    --dry-run
```

### GitHub Actions Testing

The project uses GitHub Actions for CI/CD. All tests must pass before a PR can be merged. Check the `.github/workflows` directory for workflow configurations.

## Release Process

This project uses automated releases via release-it and GitHub Actions. Maintainers will handle the release process. The versioning follows [Semantic Versioning](https://semver.org/).

## Style Guide

### Shell Scripts

- Use bash for shell scripts
- Include error handling
- Add comments for complex logic
- Use meaningful variable names

### Docker

- Keep the Dockerfile clean and well-documented
- Use specific versions for dependencies
- Follow Docker best practices for security and efficiency

### Documentation

- Use clear and concise language
- Include code examples where appropriate
- Keep the README and documentation up to date
- Use proper markdown formatting

## Questions?

If you have questions about contributing, feel free to:

- Open an issue with the `question` label
- Reach out to the maintainers

## License

By contributing to this project, you agree that your contributions will be licensed under the [MIT License](./LICENSE).

## Recognition

Contributors will be recognized in the project. Thank you for your contributions!

---

Thank you for contributing to Release It - Containerized! 🎉
