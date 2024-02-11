const isDefaultBranch = process.argv.includes("--git.tagExclude=*[-]*");

const writerOpts = {};

if (isDefaultBranch) {
  writerOpts["generateOn"] = undefined;
}

module.exports = {
  plugins: {
    "@release-it/conventional-changelog": {
      gitRawCommitsOpts: {
        path: ".",
      },
      writerOpts,
      header:
        "# Changelog\n\nThis changelog is updated automatically using release-it.\n",
      infile: "CHANGELOG.md",
      path: ".",
      preset: {
        name: "conventionalcommits",
        types: [
          {
            section: "Features",
            type: "feat",
          },
          {
            section: "Bug Fixes",
            type: "fix",
          },
          {
            section: "Tests",
            type: "test",
          },
          {
            section: "Chores",
            type: "chore",
          },
          {
            section: "Documentation",
            type: "docs",
          },
          {
            section: "Performance Improvements",
            type: "perf",
          },
          {
            section: "Code Refactoring",
            type: "refactor",
          },
          {
            section: "Code Style Changes",
            type: "style",
          },
          {
            section: "Build Changes",
            type: "build",
          },
          {
            section: "Continuous Integration",
            type: "ci",
          },
          {
            section: "Reverts",
            type: "revert",
          },
        ],
      },
    },
    "@release-it/bumper": {
      in: {
        file: "VERSION",
        type: "text/plain",
      },
      out: {
        file: "VERSION",
        type: "text/plain",
      },
    },
  },
  git: {
    commitMessage: "Released version ${version}",
    commitsPath: ".",
    push: true,
    requireCommits: true,
    requireCommitsFail: false,
    tagName: "${version}",
  },
  github: {
    release: true,
    releaseName: "${version}",
  },
};
