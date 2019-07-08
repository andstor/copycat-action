# Copycat
[GitHub action](https://developer.github.com/actions/) for copying files from one repository to another.

## Usage
```
action "Copycat" {
  uses = "andstor/copycat-action@v1.0.0"
  secrets = ["GH_PAT"]
  env = {
    DST_OWNER = "andstor"
    DST_REPO_NAME = "copycat-action"
    SRC_WIKI = "true"
    DST_PATH = "/wiki/"
    SRC_PATH = "/."
  }
}
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
|`SRC_WIKI`|Optional|Set to `true` if the source repository you want to copy from is the GitHub Wiki.| `false`|
|`DST_WIKI`|Optional|Set to `true` if the destination repository you want to copy from is the GitHub Wiki.|`false`|

## Secrets
* `GH_PAT`: (required) GitHub Private Access Token used for the clone/push operations. To create it follow the [GitHub Documentation](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line).

## Author
The Copycat GitHub action is written by [André Storhaug](https://github.com/andstor) <andr3.storhaug@gmail.com>

## License
This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.
