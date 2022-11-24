# .NET Setup

![License: MIT][shield-license-mit]
[![CI][shield-ci]][workflow-ci]
[![Ubuntu][shield-platform-ubuntu]][job-runs-on]
[![macOS][shield-platform-macos]][job-runs-on]
[![Windows][shield-platform-windows]][job-runs-on]

A GitHub Action to set up a specific version of the .NET SDK in a workflow run.

## Features

- Sets up a [.NET CLI][dotnet-sdk] environment for use in GitHub Actions
- Registers a [problem matcher][problem-matchers] for error output
- Configures some .NET CLI related environment variables for best performance
- Supports all platforms (Linux, macOS, Windows)

> **Note**
>
> This action mainly provides a wrapper around the official [setup-dotnet][action-setup-dotnet] action with a few additional quality-of-life improvements.

## Usage

### Set up a specific SDK version

```yaml
steps:
  - name: .NET Setup
    uses: zyactions/dotnet-setup@master
    with:
      dotnet-version: '7.0.0'
```

### Set up multiple SDK versions

```yaml
steps:
  - name: .NET Setup
    uses: zyactions/dotnet-setup@master
    with:
      dotnet-version: |
        7.0.x
        6.0.x
```

### Set up SDK version from 'global.json'

```yaml
steps:
  - name: .NET Setup
    uses: zyactions/dotnet-setup@master
    with:
      global-json-file: ./global.json
```

## Inputs

### `dotnet-version`

Allows to specify optional SDK version(s) to use. If not provided, will install `global.json` version when available.

The `dotnet-version` input supports following syntax:

- `A.B.C` installs exact version of .NET SDK
- `A.B` or `A.B.x` installs the latest patch version of .NET SDK on the given channel, including prerelease versions (`preview`, `rc`)
- `A` or `A.x` installs the latest minor version of the specified major tag, including prerelease versions (`preview`, `rc`)

> **Note**
>
> In case multiple versions are installed, the latest .NET version will be used by default unless another version is specified in the `global.json` file.
>
> In case both `dotnet-version` and `global-json-file` inputs are used, versions from both inputs will be installed.

### `dotnet-quality`

This input sets up the action to install the latest build of the specified quality in the channel.

The possible values of `dotnet-quality` are:

- `daily`
- `signed`
- `validated`
- `preview`
- `ga`

> **Note**
>
> The `dotnet-quality` input can be used only with .NET SDK version in `A.B`, `A.B.x`, `A` and `A.x` formats where the major version is higher than `5`. In other cases, this input will be ignored.

### `global-json-file`

Allows to specify the location of the `global.json`, if it isn't located in the root of the repo.

### `problem-matcher`

Wheather to use the .NET problem matcher. The default problem matcher is automatically registered by the wrapped [setup-dotnet][action-setup-dotnet] action. Setting `problem-matcher` to `false` will unregister it.

## Outputs

### `dotnet-version`

The `dotnet-version` output contains the .NET SDK version installed by the action. Have a look at the `dotnet-version` input to learn about precedence rules when specifying multiple versions and/or additionally using the `global.json` file.

## Dependencies

This action does use the following official GitHub Actions dependencies:

- [setup-dotnet][action-setup-dotnet]

## Versioning

Versions follow the [semantic versioning scheme][semver].

## License

.NET Setup Action is licensed under the MIT license.

[action-setup-dotnet]: https://github.com/actions/setup-dotnet
[dotnet-sdk]: https://github.com/dotnet/sdk
[job-runs-on]: https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on
[problem-matchers]: https://github.com/actions/runner/blob/main/docs/adrs/0276-problem-matchers.md
[semver]:https://semver.org
[shield-license-mit]: https://img.shields.io/badge/License-MIT-blue.svg
[shield-ci]: https://github.com/zyactions/dotnet-setup/actions/workflows/ci.yml/badge.svg
[shield-platform-ubuntu]: https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu\&logoColor=white
[shield-platform-macos]: https://img.shields.io/badge/macOS-53C633?logo=apple\&logoColor=white
[shield-platform-windows]: https://img.shields.io/badge/Windows-0078D6?logo=windows\&logoColor=white
[workflow-ci]: https://github.com/zyactions/dotnet-setup/actions/workflows/ci.yml
