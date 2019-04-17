#!/usr/bin/env bash

REPO_ROOT="$(git rev-parse --show-toplevel)"
WORKSPACE_FILEPATH="third_party/jvm_workspace.bzl"
DEPS_YAML_FILEPATH="tools/dependencies/jvm_dependencies.yaml"

usage() { echo "./update_jvm_dependencies.sh <path to bazel-deps repo>"; }

if [[ -z "${1:-}" ]]; then
    usage
    exit 1
fi

cd ${1}

bazel run //:parse -- generate -r ${REPO_ROOT} -s ${WORKSPACE_FILEPATH} -d ${DEP_YAML_FILEPATH}