#!/bin/bash

source "common.sh"

echo ""
echo "(Re)create index ${NAME?} ..."
./createIndex.sh


echo ""
echo "Create participant mapping..."
./participantMapping.sh


echo ""
echo "Create participant mapping..."
./entryMapping.sh


echo ""
echo "Create comment mapping..."
./commentMapping.sh


echo ""
echo ""
echo ""
echo "Creating test data"
./loadTestData2.sh
