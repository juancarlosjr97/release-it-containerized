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
            section: "Bug Fixes",
            type: "fix",
          },
          {
            section: "Build Changes",
            type: "build",
          },
          {
            section: "Chores",
            type: "chore",
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
            section: "Continuous Integration",
            type: "ci",
          },
          {
            section: "Documentation",
            type: "docs",
          },
          {
            section: "Features",
            type: "feat",
          },
          {
            section: "Performance Improvements",
            type: "perf",
          },
          {
            section: "Reverts",
            type: "revert",
          },
          {
            section: "Tests",
            type: "test",
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
