#!/bin/sh
#
# @author André Storhaug <andr3.storhaug@gmail.com>
# @date 2020-02-22
# @license MIT
# @version 2.0.0

set -o pipefail

PERSONAL_TOKEN="$INPUT_PERSONAL_TOKEN"
SRC_PATH="$INPUT_SRC_PATH"
DST_PATH="$INPUT_DST_PATH"
DST_OWNER="$INPUT_DST_OWNER"
DST_REPO_NAME="$INPUT_DST_REPO_NAME"
SRC_BRANCH="$INPUT_SRC_BRANCH"
DST_BRANCH="$INPUT_DST_BRANCH"
SRC_WIKI="$INPUT_SRC_WIKI"
DST_WIKI="$INPUT_DST_WIKI"
USERNAME="$INPUT_USERNAME"
EMAIL="$INPUT_EMAIL"

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

BASE_PATH=$(pwd)
DST_PATH="${DST_PATH:-${SRC_PATH}}"

USERNAME="${USERNAME:-${GITHUB_ACTOR}}"
EMAIL="${EMAIL:-${GITHUB_ACTOR}@users.noreply.github.com}"

SRC_BRANCH="${SRC_BRANCH:-master}"
DST_BRANCH="${DST_BRANCH:-master}"

SRC_REPO="${GITHUB_REPOSITORY}${SRC_WIKI}"
SRC_REPO_NAME="${GITHUB_REPOSITORY#*/}${SRC_WIKI}"
DST_REPO="${DST_OWNER}/${DST_REPO_NAME}${DST_WIKI}"
DST_REPO_NAME="${DST_REPO_NAME}${DST_WIKI}"

DIR="${DST_PATH%/*}"

git config --global user.name "${USERNAME}"
git config --global user.email "${EMAIL}"

if [[ -z "$SRC_FILTER" ]]; then
    echo "Copying \"${SRC_REPO_NAME}/${SRC_PATH}\" and pushing it to ${GITHUB_REPOSITORY}"
else
    echo "Copying files matching \"${SRC_FILTER}\" from \"${SRC_REPO_NAME}/${SRC_PATH}\" and pushing it to ${GITHUB_REPOSITORY}"
fi

git clone --branch ${SRC_BRANCH} --single-branch --depth 1 https://${PERSONAL_TOKEN}@github.com/${SRC_REPO}.git
if [ "$?" -ne 0 ]; then
    echo >&2 "Cloning '$SRC_REPO' failed"
    exit 1
fi
rm -rf ${SRC_REPO_NAME}/.git

if [[ -n "$SRC_FILTER" ]]; then
    find ${SRC_REPO_NAME}/ -type f -not -name "${SRC_FILTER}" -exec rm {} \;
fi

git clone --branch ${DST_BRANCH} --single-branch --depth 1 https://${PERSONAL_TOKEN}@github.com/${DST_REPO}.git
if [ "$?" -ne 0 ]; then
    echo >&2 "Cloning '$DST_REPO' failed"
    exit 1
fi

mkdir -p ${DST_REPO_NAME}/${DIR} || exit "$?"
cp -rf ${SRC_REPO_NAME}/${SRC_PATH} ${DST_REPO_NAME}/${DST_PATH} || exit "$?"
cd ${DST_REPO_NAME} || exit "$?"

if [ -d "${BASE_PATH}/${SRC_REPO_NAME}/${SRC_PATH}" ]; then
    COMMIT_MESSAGE="Update file(s) in \"${SRC_PATH}\" from \"${GITHUB_REPOSITORY}\""
else
    COMMIT_MESSAGE="Update file \"${SRC_PATH}\" from \"${GITHUB_REPOSITORY}\""
fi

if [ -z "$(git status --porcelain)" ]; then
    # Working directory is clean
    echo "No changes detected "
else
    # Uncommitted changes
    git add -A
    git commit --message "${COMMIT_MESSAGE}"
    git push origin ${DST_BRANCH}
fi

echo "Copying complete 👌"
