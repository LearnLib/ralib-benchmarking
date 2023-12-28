#!/usr/bin/env bash

set -euxo pipefail

git clean -xfd
( cd ralib; git clean -xfd )

rm --recursive --force packages
mkdir packages
wget --input-file artifact-debian-deps --directory-prefix packages

rm --recursive --force m2
mkdir m2
podman create \
       --volume "$(pwd):/workdir" --workdir /workdir \
       --pull always --replace --rm \
       --env DEBIAN_FRONTEND=noninteractive \
       --name ralib-m2 ubuntu:22.04 sleep infinity
podman start ralib-m2
podman exec ralib-m2 apt-get update
podman exec ralib-m2 apt-get install --yes --no-install-recommends maven openjdk-17-jdk-headless
podman exec ralib-m2 cp --recursive /workdir/ralib /ralib
podman exec --workdir /ralib ralib-m2 mvn -Dmaven.repo.local=/workdir/m2 dependency:go-offline package assembly:single
podman stop --time 0 ralib-m2

wget --content-disposition https://tu-dortmund.sciebo.de/s/iVtNb1kVGtIXGuO/download
tar --extract --verbose --file results-plots-*.tar.gz

zip --symlinks --recurse-paths -9 --verbose ralib-tacas24-repro.zip \
    benchmarks \
    configs \
    experiments \
    m2 \
    packages \
    plots \
    ralib \
    results \
    build.sh \
    collate_experiment.sh \
    collate_results.sh \
    compare-learners.sh \
    generate-plots-tacas2024.sh \
    generate-summary-model-checker-tacas2024.sh \
    generate-summary-with-ce-search-tacas2024.sh \
    generate-table-tacas2024.sh \
    install-deps.sh \
    print_series.sh \
    run-big-experiments-with-ce-search-tacas2024.sh \
    run_evaluation.sh \
    run_experiment.sh \
    run-experiments-model-checker-tacas2024.sh \
    run-experiments-with-ce-search-tacas2024.sh \
    run_series.sh \
    search_logs.sh \
    --exclude '*.git' '*.directory' '*.DS_Store' '*._*'
