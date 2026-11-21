---
on:
  workflow_run:
    workflows: ["Schedule"]
    types: [completed]
    branches:
      - main
  workflow_dispatch:
    inputs:
      run_id:
        description: "Failed Schedule workflow run ID to inspect"
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
  create-issue:
    title-prefix: "[security-maintenance] "
    expires: false
  report-failure-as-issue: false
---

# security-image-review

Review a failed `Schedule` workflow run for `juancarlosjr97/release-it-containerized`.

Your goal is to create exactly one actionable issue only when the scheduled run failed because of the image security scan.

## Required flow

1. Determine the workflow run to inspect:
   - for `workflow_run`, use the triggering run
   - for `workflow_dispatch`, use the provided `run_id` input
2. Inspect that workflow run and stop immediately with `noop` unless all of the following are true:
   - the workflow name is `Schedule`
   - the workflow file path is `.github/workflows/schedule.yaml`
   - the run conclusion is `failure`
3. Read the jobs for the run and identify the failed jobs.
4. Continue only when at least one failed job is the image security scan, such as a job whose name contains `security`, `Image Security Scan`, or `trivy`.
5. Read the failed job logs and extract the actionable security details:
   - vulnerable packages
   - CVE identifiers
   - installed versions
   - fixed versions
   - the run URL and job URL
6. Search for an existing open issue in this repository created by this workflow. Reuse the hidden workflow marker `gh-aw-workflow-id: security-image-review` when searching. If an open issue already exists for the same unresolved security scan failure, call `noop` and mention the existing issue number instead of creating a duplicate.

## Issue requirements

If you create an issue, make it execution-ready for GitHub Copilot:

- Summarize the failed scheduled run, including the run number, run URL, head SHA, failed job name, and the reason the workflow failed.
- Include the specific Trivy findings in a compact table or list.
- State that the follow-up automation will assign the issue to GitHub Copilot with the `maintenance-agent` custom agent to prepare a pull request fixing the vulnerable packages.
- Instruct the assignee to follow the repository conventions in `AGENTS.md` and `.github/agents/MAINTENANCE.AGENT.md`.
- Call out these repository rules explicitly:
  - keep GitHub Actions pinned to full SHAs with version comments
  - keep Dockerfile package versions pinned through Renovate-managed `ENV` variables
  - do not edit `CHANGELOG.md` or `VERSION` directly
- Make the title specific to the scheduled failure, for example `Scheduled image security scan failed on run #1234`.

If the scheduled run failed for a different reason, or if you cannot confirm an image security scan failure from the workflow data, you MUST call `noop` with a short explanation.
