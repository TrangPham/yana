#!/bin/bash

source "common.sh"

echo "(Re)create index ${NAME?} ..."
exec "createIndex.sh"

echo "Create participant mapping..."
exec "participantMapping.sh"
