#!/usr/bin/env bash

# Taken from here: https://stackoverflow.com/a/72068155/6515818
pad() {
  [ "$#" -gt 1 ] && [ -n "$2" ] && printf "%$2.${2#-}s" "$1";
}
