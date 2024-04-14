#!/bin/bash
#./scripts/dev.sh
cd "$(dirname "$0")"
cd ../dist/
onyx run server.wasm &
cd ..
onyx watch \
    -r js \
    -o ./dist/app.wasm \
    --feature optional-semicolons \
    main.onyx
