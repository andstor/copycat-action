#!/bin/sh
#
# @author André Storhaug <andr3.storhaug@gmail.com>
# @date 2019-07-01
# @copyright MIT
# @version 0.1.2

set -o pipefail

if [[ -z "$SRC_PATH" ]]; then
  echo "SRC_PATH environment variable is missing. Cannot proceed."
  exit 1
fi

if [[ -z "$DST_OWNER" ]]; then
  echo "DST_OWNER environment variable is missing. Cannot proceed."
  exit 1
fi

if [[ -z "$DST_REPO_NAME" ]]; then
  echo "DST_REPO_NAME environment variable is missing. Cannot proceed."
  exit 1
fi

if [ "$SRC_WIKI" = "true" ]; then
    SRC_WIKI=".wiki"
else
    SRC_WIKI=""
fi

if [ "$DST_WIKI" = "true" ]; then
    DST_WIKI=".wiki"
else
    DST_WIKI=""
fi

DST_PATH="${DST_PATH:-${SRC_PATH}}"

SRC_BRANCH="${SRC_BRANCH:-master}"
DST_BRANCH="${DST_BRANCH:-master}"

SRC_REPO="${GITHUB_REPOSITORY}${SRC_WIKI}"
SRC_REPO_NAME="${GITHUB_REPOSITORY#*/}${SRC_WIKI}"
DST_REPO="${DST_OWNER}/${DST_REPO_NAME}${DST_WIKI}"
DST_REPO_NAME="${DST_REPO_NAME}${DST_WIKI}"

DIR="${DST_PATH%/*}"

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

echo "Copying \"${SRC_REPO_NAME}/${SRC_PATH}\" and pushing it to ${GITHUB_REPOSITORY}"

git clone --branch ${SRC_BRANCH} --single-branch --depth 1 https://${GH_PAT}@github.com/${SRC_REPO}.git
if [ "$?" -ne 0 ]; then
    echo >&2 "Cloning '$SRC_REPO' failed"
    exit 1
fi
rm -rf ${SRC_REPO_NAME}/.git # TODO: Remove every file that matches a filter (issue #1)

git clone --branch ${DST_BRANCH} --single-branch --depth 1 https://${GH_PAT}@github.com/${DST_REPO}.git
if [ "$?" -ne 0 ]; then
    echo >&2 "Cloning '$DST_REPO' failed"
    exit 1
fi

mkdir -p ${DST_REPO_NAME}/${DIR} || exit "$?"
cp -rf ${SRC_REPO_NAME}/${SRC_PATH} ${DST_REPO_NAME}/${DST_PATH} || exit "$?"

cd ${DST_REPO_NAME} || exit "$?"

if [ -z "$(git status --porcelain)" ]; then
    # Working directory is clean
    echo "No changes detected "
else
    # Uncommitted changes
    git add -A
if [ -d /bin ]; then
    COMMIT_MESSAGE="Update file(s) in \"${SRC_PATH}\" from \"${GITHUB_REPOSITORY}\""
else
    COMMIT_MESSAGE="Update file \"${SRC_PATH}\" from \"${GITHUB_REPOSITORY}\""
fi
    git commit --message "${COMMIT_MESSAGE}"

    git push -u origin ${DST_BRANCH}
fi

echo "Copying complete 👌"