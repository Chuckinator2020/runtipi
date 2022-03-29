#!/usr/bin/env bash
set -euo pipefail

ROOT_FOLDER="$(readlink -f $(dirname "${BASH_SOURCE[0]}")/..)"
STATE_FOLDER="${ROOT_FOLDER}/state"

show_help() {
  cat << EOF
app 0.0.1

CLI for managing Tipi apps

Usage: app <command> <app> [<arguments>]

Commands:
    install                    Pulls down images for an app and starts it
    uninstall                  Removes images and destroys all data for an app
    stop                       Stops an installed app
    start                      Starts an installed app
    compose                    Passes all arguments to docker-compose
    ls-installed               Lists installed apps
EOF
}

# Get field from json file
function get_json_field() {
    local json_file="$1"
    local field="$2"

    echo $(jq -r ".${field}" "${json_file}")
}

list_installed_apps() {
  str=$(get_json_field ${STATE_FOLDER}/apps.json installed)
  echo $str
}

if [ -z ${1+x} ]; then
  command=""
else
  command="$1"
fi

# Lists installed apps
if [[ "$command" = "ls-installed" ]]; then
  list_installed_apps

  exit
fi

if [ -z ${2+x} ]; then
  show_help
  exit 1
else
  app="$2"
  app_dir="${ROOT_FOLDER}/apps/${app}"
  app_data_dir="${ROOT_FOLDER}/app-data/${app}"

  if [[ -z "${app}" ]] || [[ ! -d "${app_dir}" ]]; then
    echo "Error: \"${app}\" is not a valid app"
    exit 1
  fi
fi

if [ -z ${3+x} ]; then
  args=""
else
  args="${@:3}"
fi

compose() {
  local app="${1}"
  shift
  
  # App data folder
  local env_file="${ROOT_FOLDER}/.env"
  local app_base_compose_file="${ROOT_FOLDER}/apps/docker-compose.common.yml"
  local app_compose_file="${app_dir}/docker-compose.yml"

  # Vars to use in compose file
  export APP_DATA_DIR="${app_data_dir}"
  export APP_PASSWORD="password"

  docker-compose \
    --env-file "${env_file}" \
    --project-name "${app}" \
    --file "${app_base_compose_file}" \
    --file "${app_compose_file}" \
    "${@}"
}

# Removes images and destroys all data for an app
if [[ "$command" = "uninstall" ]]; then

  echo "Removing images for app ${app}..."
  compose "${app}" down --rmi all --remove-orphans

  echo "Deleting app data for app ${app}..."
  if [[ -d "${app_data_dir}" ]]; then
    rm -rf "${app_data_dir}"
  fi

  echo "Removing app ${app} from DB..."
  update_installed_apps remove "${app}"

  echo "Successfully uninstalled app ${app}"
  exit
fi

# Stops an installed app
if [[ "$command" = "stop" ]]; then

  echo "Stopping app ${app}..."
  compose "${app}" rm --force --stop

  exit
fi

# Starts an installed app
if [[ "$command" = "start" ]]; then
  echo "Starting app ${app}..."
  compose "${app}" up --detach

  exit
fi

# Passes all arguments to docker-compose
if [[ "$command" = "compose" ]]; then
  compose "${app}" ${args}

  exit
fi

# If we get here it means no valid command was supplied
# Show help and exit
show_help
exit 1