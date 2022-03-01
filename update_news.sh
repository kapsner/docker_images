#!/bin/bash
set -e
set -o pipefail

auto-changelog -u -t "R for datascience" -o "NEWS.md"
