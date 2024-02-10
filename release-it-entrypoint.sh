#!/bin/bash

set -e

GIT_DIRECTORY="${GIT_DIRECTORY:-}"
GIT_EMAIL="${GIT_EMAIL:-}"
GIT_REPOSITORY="${GIT_REPOSITORY:-}"
GIT_USERNAME="${GIT_USERNAME:-}"
GPG_PRIVATE_KEY_ID="${GPG_PRIVATE_KEY_ID:-}"
GPG_PRIVATE_KEY="${GPG_PRIVATE_KEY:-}"
RELEASE_IT_PLUGINS=${RELEASE_IT_PLUGINS:-}
SSH_PASSPHRASE="${SSH_PASSPHRASE:-}"
SSH_PRIVATE_KEY_FILE="${SSH_PRIVATE_KEY_FILE:-}"

if [[ -n "${GIT_DIRECTORY}" ]]; then
    # Add safe directory to git global configuration
    git config --global --add safe.directory "${GIT_DIRECTORY}"
fi

if [[ -n "${GIT_EMAIL}" ]]; then
    git config --global user.email "${GIT_EMAIL}"
fi

if [[ -n "${GIT_REPOSITORY}" ]]; then
    # Set remote repository URL
    git remote set-url origin "${GIT_REPOSITORY}"
fi

if [[ -n "${GIT_USERNAME}" ]]; then
    git config --global user.name "${GIT_USERNAME}"
fi

if [[ -n "${GPG_PRIVATE_KEY_ID}" && -n "${GPG_PRIVATE_KEY}" ]]; then
    # Enable GPG signing for commits globally
    git config --global commit.gpgSign true

    # Set the GPG key for signing commits
    git config --global user.signingkey "${GPG_PRIVATE_KEY_ID}"

    if { gpg --import <(echo "${GPG_PRIVATE_KEY}"); } &>/dev/null; then
        echo "GPG private key imported successfully"
    else
        echo "Error setting up GPG private key"
        exit 1
    fi
else
    echo "GPG_PRIVATE_KEY_ID or GPG_PRIVATE_KEY are not provided. GPG setup skipped."
fi

if [[ -n "${SSH_PRIVATE_KEY_FILE}" ]]; then
    # Create SSH directory and set permissions
    mkdir -p ~/.ssh 
    chmod 700 ~/.ssh 

    # Disable strict host key checking for CI Environment
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config

    # Write the private key to the id_rsa file
    echo "${SSH_PRIVATE_KEY_FILE}" > ~/.ssh/id_rsa

    # Set permissions for the private key
    chmod 600 ~/.ssh/id_rsa

    # Start SSH agent
    if eval "$(ssh-agent -s)" > /dev/null; then
        echo "SSH agent started successfully"
    else
        echo "Error starting SSH agent"
        exit 1
    fi

    # Add private key to SSH agent
    if { echo "${SSH_PASSPHRASE}" | ssh-add  ~/.ssh/id_rsa; } &>/dev/null; then
        echo "SSH private key added to the agent successfully"
    else
        echo "Error adding SSH private key to the agent"
        exit 1
    fi
else
    echo "SSH_PRIVATE_KEY_FILE or GPG_PRIVATE_KEY are not provided. SSH setup skipped"
fi

# Set RELEASE_IT_VERSION default value if not provided
RELEASE_IT_VERSION=${RELEASE_IT_VERSION:-latest}

# Configure NPM global settings
# Adjust the global directory for NPM to a location with full permissions for the node user, set during the image build
NPM_GLOBAL_DIR=/home/node/.npm-global
PATH=${NPM_GLOBAL_DIR}/bin:${PATH}

mkdir -p "${NPM_GLOBAL_DIR}"
npm config set prefix "${NPM_GLOBAL_DIR}"
npm config set update-notifier false -g

# Install release-it globally
npm install --silent -g release-it@"${RELEASE_IT_VERSION}" "${RELEASE_IT_PLUGINS}"

# Execute the provided command
exec "$@"
