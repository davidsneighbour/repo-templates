# NPM scripts

## Versioning

```json5
"scripts": {
  "release": "standard-version --release-as patch -a -t \"v\" && ./bin/release-hook-postrelease.sh",
  "release:major": "standard-version --release-as major -a -t \"v\" && ./bin/release-hook-postrelease.sh",
  "release:minor": "standard-version --release-as minor -a -t \"v\" && ./bin/release-hook-postrelease.sh",
}
```

## Cleaning

```json5
"scripts": {
  "clean": "run-p clean:*",
  "clean:hugo": "rimraf hugo.log hugo_stats.json",
  "clean:npm": "rimraf node_modules && rimraf package-lock.json",
}
```

## Linting

### Textlint

```json5
"scripts": {
  "lint:textlint": "textlint --config @dnb-org/textlint-config .",
  "lint:textlint:fix": "textlint --config @dnb-org/textlint-config --fix .",
  "lint:textlint2": "textlint --config @dnb-org/textlint-config",
  "lint:textlint2:fix": "textlint --config @dnb-org/textlint-config --fix",
}
```

### Remark

```json5
"scripts": {
  "remark": "remark content/",
  "remark:file": "remark",
}
```

## Programs

### Hugo

```json5
"scripts": {
  "build": "run-s build:*",
  "build:hugo": "hugo --gc",
  "serve": "hugo server --bind 192.168.1.201 --baseURL http://192.168.1.201 --disableFastRender --i18n-warnings --navigateToChanged  --templateMetrics --templateMetricsHints --verbose --verboseLog --path-warnings --buildDrafts --buildExpired --buildFuture --watch --enableGitInfo --forceSyncStatic --log true --logFile hugo.log -v",
}
```
