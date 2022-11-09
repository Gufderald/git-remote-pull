#!/bin/sh
git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}
git fetch target
git fetch origin

git config --global user.name "github-actions[bot]"
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"

{
  git switch -c {GITHUB_REF_NAME} target/${GITHUB_REF_NAME}
} || {
  echo $?
  exit 1
}

git push origin ${GITHUB_REF_NAME}
