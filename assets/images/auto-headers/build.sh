#!/usr/bin/env bash

REQUIRED_TOOLS=(
  cd
  exit
  pwd
  inkscape
  rm
  sed
  optipng
)

for TOOL in "${REQUIRED_TOOLS[@]}"; do
  if ! command -v "${TOOL}" >/dev/null; then
    echo "${TOOL} is required... "
    exit 1
  fi
done

# file location
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"

# list of elements to create
COMPONENTS=(\
  "ASSETS UNSPLASH" \
  "ASYLUM" \
  "AUDITOR" \
  "DEBUG" \
  "ERRORS" \
  "FUNCTIONS" \
  "GISCUS" \
  "HEAD" \
  "HOOKS" \
  "INTERNALS" \
  "NETLIFICATION" \
  "OPENSEARCH" \
  "PICTURES" \
  "PWA" \
  "RENDERHOOKS" \
  "ROBOTS" \
  "SCHEMA" \
  "SEARCH ALGOLIA" \
  "SECURITY" \
  "SITEMAP" \
  "SOCIAL" \
)

# go through elements
for INDEX in "${COMPONENTS[@]}"; do
  rm -f "${SCRIPTPATH}"/temp.svg
  echo "$INDEX";
  find_string='>NAME<'
  replace_string=">${INDEX}<"
  sed -E "s/${find_string}/${replace_string}/" "${SCRIPTPATH}"/template.svg > "${SCRIPTPATH}"/temp.svg
  inkscape "${SCRIPTPATH}"/temp.svg --export-filename="${SCRIPTPATH}"/cards/github-card-"${INDEX,,}"-light.png
  optipng -strip all -quiet -o7 "${SCRIPTPATH}"/cards/github-card-"${INDEX,,}"-light.png

  find_string='style="display:none"'
  replace_string='style="display:block"'
  sed -E "s/${find_string}/${replace_string}/" "${SCRIPTPATH}"/temp.svg > "${SCRIPTPATH}"/temp2.svg
  inkscape "${SCRIPTPATH}"/temp2.svg --export-filename="${SCRIPTPATH}"/cards/github-card-"${INDEX,,}"-dark.png
  optipng -strip all -quiet -o7 "${SCRIPTPATH}"/cards/github-card-"${INDEX,,}"-dark.png
done

# cleanup
rm -f "${SCRIPTPATH}"/temp.svg "${SCRIPTPATH}"/temp2.svg
