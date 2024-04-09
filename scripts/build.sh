#!/bin/bash
onyx pkg build client
onyx pkg build server
cd "$(dirname "$0")"
mv ../dist/app.wasm.js ../dist/app.js