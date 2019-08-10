export VIRTUAL_ENV_DISABLE_PROMPT=1$a
mkdir -p ~/.venvs

function manage_venv {
  if [ -d "${HOME}/.venvs/$(basename $(pwd))" ]; then
    if [ "${VIRTUAL_ENV}" ]; then
      deactivate
    fi
  elif [ "$1" = "make" ]; then
    python3 -m venv "${HOME}/.venvs/$(basename $(pwd))"
  else
    echo "Syntax: VENV [MAKE]"
    return 0
  fi
  source "${HOME}/.venvs/$(basename $(pwd))/bin/activate"
}

function cd_with_venv {
  command cd "$@"

  if [ "${VIRTUAL_ENV}" ]; then
    deactivate > /dev/null 2>&1
  fi

  CURRENT_DIR=`pwd`
  while [ "${CURRENT_DIR}" != "/" ]; do
    if [ -d "${HOME}/.venvs/$(basename ${CURRENT_DIR})" ]; then
      command cd "${CURRENT_DIR}" > /dev/null
      manage_venv
      command cd - > /dev/null 2>&1
      break
    fi

    CURRENT_DIR=`dirname "${CURRENT_DIR}"`
  done
}

alias venv=manage_venv
alias cd=cd_with_venv

