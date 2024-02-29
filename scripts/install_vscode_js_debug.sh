#!/bin/bash

set -ev

DATAPATH="$1"

if [ -z "$DATAPATH" ]; then exit 1; fi

CLONEPATH="$DATAPATH/vscode-js-debug"
EXECPATH="$CLONEPATH/out/src/vsDebugServer.js"

if [ "$NVPUNK_REINSTALL" == "1" ]; then
    rm -rf "$CLONEPATH"
fi

if [ -f "$EXECPATH" ]; then exit 0; fi

git clone https://github.com/microsoft/vscode-js-debug "$CLONEPATH"
cd "$CLONEPATH"
npm install
npx gulp vsDebugServerBundle
mv dist out
