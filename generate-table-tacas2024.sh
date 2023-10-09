#!/bin/sh

./generate-summary-with-ce-search-tacas2024.sh | sed -e "s/_/-/g" > plots/tacas2024-table-results.csv

cd plots

latexmk -pdf tacas2024-table-results.tex

cd ..
