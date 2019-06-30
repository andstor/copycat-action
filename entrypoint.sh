#!/bin/sh

if [[ -z "${SRC_PATH}" ]]; then
  echo "SRC_PATH environment variable is missing. Cannot proceed."
  exit 1
fi

if [[ -z "${REPOSITORY}" ]]; then
  echo "REPOSITORY environment variable is missing. Cannot proceed."
  exit 1
fi

if [ -n "${SRC_WIKI}" = true ]; then
    SRC_WIKI=".wiki"
else
    SRC_WIKI=""
fi

if [ -n "${DST_WIKI}" = true ]; then
    DST_WIKI=".wiki"
else
    DST_WIKI=""
fi

DST_PATH="${DST_PATH:-${SRC_PATH}}"
SRC_BRANCH="${SRC_BRANCH:-master}"
DST_BRANCH="${DST_BRANCH:-master}"

DIR=${SRC_PATH%/*}

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

echo "Copying \"${SRC_PATH}\" and pushing it to ${GITHUB_REPOSITORY}"

git clone --branch ${SRC_BRANCH} --single-branch --depth 1 https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}${SRC_WIKI}.git
git clone --branch ${DST_BRANCH} --single-branch --depth 1 https://${GH_PAT}@github.com/${REPOSITORY}${DST_WIKI}.git

mkdir -p DIR
cp -rf ${GITHUB_REPOSITORY}${SRC_WIKI}/${SRC_PATH} ${REPOSITORY}${DST_WIKI}/${DST_PATH}

cd ${REPOSITORY}

git add -A
git commit --message "Update ${SRC_PATH}${DST_WIKI} from ${GITHUB_REPOSITORY}${SRC_WIKI}"

git push -u origin ${DST_BRANCH}

echo "Copying complete 👌"