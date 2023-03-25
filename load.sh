#!/bin/bash

pushd ~/Documents/UW/MIMUW/ZPP/

repos=(
    bazel-bsp
    rules_rust
    thesis-diagrams
    intellij-rust
    build-server-protocol
)

for repo in "${repos[@]}"; do
    echo "Loading $repo"
    gh repo clone ZPP-This-is-fine/$repo
done

popd
