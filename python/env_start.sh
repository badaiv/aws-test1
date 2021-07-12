#!/usr/bin/env bash
#set -x


#check env dependencies
check_env() {
  # check that we have pyton3
  command -v python3 >/dev/null 2>&1 || {
    echo >&2 "there is no python3 in you PATH. aborting."
    exit 1
  }
}

start_python_shell() {
  python3 --version && pip --version || (
    echo >&2 "please check that you have 'python3' and 'pip' installed "
    exit 1
  )
  echo "install pipenv:"
  pipenv --version || pip install --user pipenv
  echo "install local env:"
  pipenv install
  echo "loading local env:"
  pipenv shell
}

main() {
  check_env
  start_python_shell
}

main "$@"
