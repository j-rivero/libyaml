#!/bin/sh

set -e

main() {
  # CMake based in-source build and tests
  clean

  CXXFLAGS="--coverage" cmake -DCMAKE_BUILD_TYPE=Debug .
  make
  make test
}

clean() {
  git clean -d -x -f
  rm -fr tests/run-test-suite
  git worktree prune
}

main "$@"
