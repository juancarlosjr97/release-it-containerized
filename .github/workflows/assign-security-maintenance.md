---
on:
  issues:
    types: [opened]
  workflow_dispatch:
    inputs:
      issue_number:
        description: "Security maintenance issue number to assign to Copilot"
        required: true
        type: string
permissions:
  actions: read
  contents: read
  issues: read
  pull-requests: read
engine: copilot
network: defaults
tools:
  github:
    toolsets: [default]
safe-outputs:
  assign-to-agent:
    name: "copilot"
    custom-agent: "maintenance-agent"
    allowed: [copilot]
    target: "*"
    base-branch: "main"
    github-token: ${{ secrets.PROJECT_GITHUB_TOKEN }}
  report-failure-as-issue: false
---

# assign-security-maintenance

Inspect the target issue in `juancarlosjr97/release-it-containerized`.

Only assign the issue to GitHub Copilot when it was created by the `security-image-review` workflow for a scheduled image security failure.

## Required checks

1. Determine the issue number to inspect:
   - for `issues`, use the triggering issue number
   - for `workflow_dispatch`, use the provided `issue_number` input
2. Confirm the issue is open.
3. Confirm the issue title starts with `[security-maintenance]`.
4. Confirm the issue body contains the hidden marker `gh-aw-workflow-id: security-image-review`.
5. Confirm the issue is intended for scheduled image security remediation, not a user-created issue.
6. If GitHub Copilot is already assigned, call `noop`.

## Action

If all checks pass, assign that specific issue number to GitHub Copilot using the `maintenance-agent` custom agent so Copilot can prepare the remediation pull request from `main`.

If any check fails, you MUST call `noop` with a short explanation.
