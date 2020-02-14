#!/bin/sh

set -e

main() {
  # CMake based in-source build and tests
  clean

  CFLAGS="--coverage -O0" cmake -DCMAKE_BUILD_TYPE=Debug .
  make VERBOSE=1
  lcov -c -i -d .. -o app_base.info
  make test
  find . -name "*.gcda"
}

clean() {
  git clean -d -x -f
  rm -fr tests/run-test-suite
  git worktree prune
}

main "$@"
