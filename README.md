# Copycat
GitHub action for copying files from one repository to another.

##Usage
```
```

## Environment variables

The following environment variable options can be configured:

|Environment variable|Description| Type |Default|
|-------|-----------| ---- |-------|
|`SRC_PATH`|The source path to the file(s) or folder(s) to copy from. For example,`home.md`|`String`||
|`DST_PATH`|The destination path to copy the file(s) or folder(s) to. For example, `pages/.`. |`String`|`SRC_PATH`|
|`DST_OWNER`|The name of the owner of the repository to push to. For example, `andstor`.|`String`||
|`DST_REPO_NAME`|The name of the repository to push to. For example, `copycat-action`.|`String`||
|`SRC_BRANCH`|The branch name of the source repository. Optional.|`String`|`master`|
|`DST_BRANCH`|The branch name of the destination repository. Optional.|`String`|`master`|
|`SRC_WIKI`|If the source repository you want to copy from is the GitHub Wiki.|`Boolean`| `false`|
|`DST_WIKI`|If the destination repository you want to copy from is the GitHub Wiki.|`Boolean`| `false`|


## Secrets
* `GITHUB_TOKEN`: (required) Include the [GitHub token secret](https://developer.github.com/actions/creating-workflows/storing-secrets/#github-token-secret) to make authenticated calls to the GitHub API for the **source repository**.

* `GH_PAT`: (required) GitHub Private Access Token used for the clone/push operations for the **destination repository**. To create it follow the [GitHub Documentation](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line).