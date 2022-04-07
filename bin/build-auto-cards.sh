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
IMAGEPATH="./assets/images/auto-headers"

# list of elements to create
COMPONENTS=(
  "assets unsplash"
  "asylum"
  "auditor"
  "bin"
  "components"
  "debug"
  "dev server sample"
  "errors"
  "exchangerates"
  "feeds"
  "functions"
  "giscus"
  "github"
  "head"
  "hooks"
  "humans"
  "icons"
  "internals"
  "matomo"
  "netlification"
  "opensearch"
  "pictures"
  "publisher"
  "pwa"
  "renderhooks"
  "robots"
  "schema"
  "search algolia"
  "security"
  "shortcodes"
  "sitemap"
  "social"
  "templates"
  "testcontent"
  "workflows"
  "youtube"
)

# go through elements
for TERM in "${COMPONENTS[@]}"; do

  # create light version
  echo "$TERM"
  find_string='>NAME<'
  replace_string=">${TERM^^}<"
  sed -E "s/${find_string}/${replace_string}/" "${IMAGEPATH}"/template.svg >"${IMAGEPATH}"/temp.svg
  inkscape "${IMAGEPATH}"/temp.svg --export-filename="${IMAGEPATH}"/cards/github-card-"${TERM// /-}"-light.png --export-area=0:320:1280:640
  optipng -strip all -quiet -o7 "${IMAGEPATH}"/cards/github-card-"${TERM,,}"-light.png
  cp "${IMAGEPATH}"/cards/github-card-"${TERM// /-}"-light.png ../dnb-hugo-"${TERM// /-}"/.github/github-card-light.png
  inkscape "${IMAGEPATH}"/temp.svg --export-filename="${IMAGEPATH}"/cards/github-card-"${TERM// /-}"-light.png
  optipng -strip all -quiet -o7 "${IMAGEPATH}"/cards/github-card-"${TERM,,}"-light.png

  # create dark version
  find_string='style="display:none"'
  replace_string='style="display:block"'
  sed -E "s/${find_string}/${replace_string}/" "${IMAGEPATH}"/temp.svg >"${IMAGEPATH}"/temp2.svg
  inkscape "${IMAGEPATH}"/temp2.svg --export-filename="${IMAGEPATH}"/cards/github-card-"${TERM// /-}"-dark.png --export-area=0:320:1280:640
  optipng -strip all -quiet -o7 "${IMAGEPATH}"/cards/github-card-"${TERM,,}"-dark.png
  cp "${IMAGEPATH}"/cards/github-card-"${TERM// /-}"-dark.png ../dnb-hugo-"${TERM// /-}"/.github/github-card-dark.png
  inkscape "${IMAGEPATH}"/temp2.svg --export-filename="${IMAGEPATH}"/cards/github-card-"${TERM// /-}"-dark.png
  optipng -strip all -quiet -o7 "${IMAGEPATH}"/cards/github-card-"${TERM,,}"-dark.png

  # cleanup
  rm -f "${IMAGEPATH}"/temp.svg "${IMAGEPATH}"/temp2.svg
done
