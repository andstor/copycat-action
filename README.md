# Copycat
<a href="https://github.com/andstor/copycat-action"><img
  src="media/logo.svg" alt="Copycat Logo"
  width="120" height="auto" align="right"></a>

[GitHub action](https://developer.github.com/actions/) for copying files from one repository to another.

## Usage
```
name: Copy
on: gollum
jobs:
  copycat:
    name: Copycat
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Copycat
      uses: andstor/copycat-action@v1.1.0
      env:
        DST_BRANCH: master
        DST_OWNER: andstor
        DST_REPO_NAME: copycat-action
        DST_PATH: /wiki/
        GH_PAT: ${{ secrets.GH_PAT }}
        SRC_BRANCH: master
        SRC_PATH: /.
        SRC_WIKI: "true"
        USERNAME: nutsbot
        EMAIL: andr3.storhaug+bot@gmail.com

```

## Environment variables
The following environment variable options can/must be configured:

|Environment variable|Required|Description|Default|
|--------------------|--------|-----------|-------|
|`SRC_PATH`|Required|The source path to the file(s) or folder(s) to copy from. For example, `/.` or `path/to/home.md`.||
|`DST_PATH`|Optional|The destination path to copy the file(s) or folder(s) to. For example, `/wiki/` or `path/to/index.md`. |`SRC_PATH`|
|`DST_OWNER`|Required|The name of the owner of the repository to push to. For example, `andstor`.||
|`DST_REPO_NAME`|Required|The name of the repository to push to. For example, `copycat-action`.||
|`SRC_BRANCH`|Optional|The branch name of the source repository. Optional.|`master`|
|`DST_BRANCH`|Optional|The branch name of the destination repository. Optional.|`master`|
|`SRC_FILTER`|Optional|A pattern for filtering files to be copied. For example `*.sh`||
|`SRC_WIKI`|Optional|Set to `true` if the source repository you want to copy from is the GitHub Wiki.| `false`|
|`DST_WIKI`|Optional|Set to `true` if the destination repository you want to copy from is the GitHub Wiki.|`false`|
|`USERNAME`|Optional|The GitHub username to associate commits made by this GitHub action.|[`GITHUB_ACTOR`](https://help.github.com/en/articles/virtual-environments-for-github-actions#environment-variables)|
|`EMAIL`|Optional|The email used for associating commits made by this GitHub action.|[`GITHUB_ACTOR`](https://help.github.com/en/articles/virtual-environments-for-github-actions#environment-variables)`@users.noreply.github.com`|

## Secrets
* `GH_PAT`: (required) GitHub Private Access Token used for the clone/push operations. To create it follow the [GitHub Documentation](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line).

## Author
The Copycat GitHub action is written by [André Storhaug](https://github.com/andstor) <andr3.storhaug@gmail.com>

## License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.
