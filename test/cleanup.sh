#!/usr/bin/env bash

function try_rename () {
  temp=$(mktemp --dry-run XXXXXXXX)
  {  mv "$1" "$1_$temp" || :; } > /dev/null 2>&1
}

if [[ -n "$DOTNET_ROOT" ]]; then
  try_rename "$DOTNET_ROOT"
fi

if [[ "$RUNNER_OS" == "Windows" ]]; then
  if [[ -n "$PROGRAMFILES" ]]; then
    try_rename "$PROGRAMFILES\dotnet"
  fi

  if [[ -n "$LOCALAPPDATA" ]]; then
    try_rename "$LOCALAPPDATA\Microsoft\dotnet"
  fi
else
  try_rename "~/.dotnet"
  try_rename "/usr/share/dotnet"
  try_rename "/usr/local/share/dotnet"
fi
