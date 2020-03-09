<p align=center>
	<img width="240" src="media/logo.svg" alt="Copycat Logo">
</p>
<h1 align="center">COPYCAT</h1>

> GitHub Action for copying files to other repositories.

This is a [GitHub action](https://developer.github.com/actions/) to copy files from your repository to another external repository. It is also possible to copy files from/to repository Wikis.

This action runs in a Docker container and therefore only supports Linux.

## Usage

The following example [workflow step](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) will copy all files from the repository running the action, to a folder named `backup` in the destination repo `copycat-action`. If the files already exist at the destination repo, they will be overwritten.

```yml
- name: Copy
  uses: andstor/copycat-action@v2
  with:
    personal_token: ${{ secrets.PERSONAL_TOKEN }}
    src_path: /.
    dst_path: /backup/
    dst_owner: andstor
    dst_repo_name: copycat-action
```

## Options ⚙️

The following input variable options can/must be configured:

|Input variable|Necessity|Description|Default|
|--------------------|--------|-----------|-------|
|`src_path`|Required|The source path to the file(s) or folder(s) to copy from. For example, `/.` or `path/to/home.md`.||
|`dst_path`|Optional|The destination path to copy the file(s) or folder(s) to. For example, `/wiki/` or `path/to/index.md`. |`src_path`|
|`dst_owner`|Required|The name of the owner of the repository to push to. For example, `andstor`.||
|`dst_repo_name`|Required|The name of the repository to push to. For example, `copycat-action`.||
|`src_branch`|Optional|The branch name of the source repository.|`master`|
|`dst_branch`|Optional|The branch name of the destination repository.|`master`|
|`filter`|Optional|A glob pattern for filtering files to be copied. Acts on file paths. For example `**/*.sh`||
|`exclude`|Optional|A glob pattern for excluding paths. For example `*/dev/*`||
|`src_wiki`|Optional|Set to `true` if the source repository you want to copy from is the GitHub Wiki.| `false`|
|`dst_wiki`|Optional|Set to `true` if the destination repository you want to copy from is the GitHub Wiki.|`false`|
|`username`|Optional|The GitHub username to associate commits made by this GitHub action.|[`GITHUB_ACTOR`](https://help.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables)|
|`email`|Optional|The email used for associating commits made by this GitHub action.|[`GITHUB_ACTOR`](https://help.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables)`@users.noreply.github.com`|

## Secrets

* `personal_token`: (required) GitHub Private Access Token used for the clone/push operations. To create it follow the [GitHub Documentation](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line).


## Examples

### Copy wiki files to external repo

This workflow configuration will copy all files from the repository's wiki to a folder named `wiki` in the destination repo `andstor.github.io`.

This can for example be used to merge several wikies of an organisation, and display them on a custom GitHub Pages site. The Jekyll theme [Paper](https://github.com/andstor/jekyll-theme-paper) has support for this.

```yml
name: Copy
on: gollum
jobs:
  copy:
    runs-on: ubuntu-latest
    steps:
    - name: Copycat
      uses: andstor/copycat-action@v2
      with:
        personal_token: ${{ secrets.PERSONAL_TOKEN }}
        src_path: /.
        dst_path: /wiki/
        dst_owner: andstor
        dst_repo_name: andstor.github.io
        dst_branch: master
        src_branch: master
        src_wiki: true
        dst_wiki: false
        username: nutsbot
        email: andr3.storhaug+bot@gmail.com
```

## Author

The Copycat GitHub action is written by [André Storhaug](https://github.com/andstor) <andr3.storhaug@gmail.com>

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.
