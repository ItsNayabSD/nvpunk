#!/bin/bash

set -ev

DATAPATH="$1"

if [ -z "$DATAPATH" ]; then exit 1; fi

CLONEPATH="$DATAPATH/vscode-java-test"

if [ "$NVPUNK_REINSTALL" == "1" ]; then
    rm -rf "$CLONEPATH"
fi

git clone https://github.com/microsoft/vscode-java-test "$CLONEPATH"

cd "$CLONEPATH"

npm install
npm run build-plugin
