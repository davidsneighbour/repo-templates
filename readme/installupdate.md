## Installing

First enable modules in your own repository if you did not already have done so:

```bash
hugo mod init github.com/username/reponame
```

Then add this module to your required modules in `config.toml`.

```toml
[module]

[[module.imports]]
path = "##MODULENAME##"
disable = false
ignoreConfig = false
ignoreImports = false

```

The next time you run `hugo` it will download the latest version of the module.

## Updating

```bash
# update this module
hugo mod get -u ##MODULENAME##
# update to a specific version
hugo mod get -u ##MODULENAME##@v1.0.0
# update all modules recursively over the whole project
hugo mod get -u ./...
```
