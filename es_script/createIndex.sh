#!/bin/bash

source "common.sh"

curl -XDELETE ${SERVER?}/${NAME?}
curl -XPOST ${SERVER?}/${NAME?}
