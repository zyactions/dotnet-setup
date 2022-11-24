#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Must supply dotnet version argument"
  exit 1
fi

DOTNET_VERSION="$(dotnet --version)"
echo "Found dotnet version '$DOTNET_VERSION'"
if [ -z "$(echo $DOTNET_VERSION | grep $1)" ]; then
  echo "Unexpected version"
  exit 1
fi

if [ -n "$2" ]; then
  DOTNET_VERSION="$(dotnet --list-sdks)"
  echo "Found dotnet version '$DOTNET_VERSION'"
  if [ -z "$(echo $DOTNET_VERSION | grep $2)" ]; then
    echo "Unexpected version"
    exit 1
  fi
fi