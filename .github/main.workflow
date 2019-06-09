workflow "psake" {
  resolves = "test"
  on       = "push"
}

workflow "psscriptanalysis" {
  on       = "pull_request"
  resolves = "analyze"
}

action "test" {
  uses = "devblackops/psake-github-action@master"
  args = "test"
}

action "analyze" {
  uses    = "devblackops/github-action-psscriptanalyzer@master"
  secrets = ["GITHUB_TOKEN"]
}
