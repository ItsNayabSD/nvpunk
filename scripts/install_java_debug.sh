#!/bin/bash

set -ev

DATAPATH="$1"

if [ -z "$DATAPATH" ]; then exit 1; fi

CLONEPATH="$DATAPATH/java-debug"


if [ "$NVPUNK_REINSTALL" == "1" ]; then
    rm -rf "$CLONEPATH"
fi

git clone https://github.com/microsoft/java-debug "$CLONEPATH"

cd "$CLONEPATH"

./mvnw clean install
