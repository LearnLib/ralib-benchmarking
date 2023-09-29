#!/bin/sh

./generate-summary-model-checker-tacas2024.sh > plots/tacas2024-summary-generated.csv

less plots/tacas2024-summary-generated.csv | grep "gen-locations" | grep "Q-20" > plots/tacas2024-gen-locations-q20.csv
less plots/tacas2024-summary-generated.csv | grep "gen-locations" | grep "Q-30" > plots/tacas2024-gen-locations-q30.csv
less plots/tacas2024-summary-generated.csv | grep "gen-locations" | grep "Q-40" > plots/tacas2024-gen-locations-q40.csv
less plots/tacas2024-summary-generated.csv | grep "gen-locations" | grep "Q-50" > plots/tacas2024-gen-locations-q50.csv
less plots/tacas2024-summary-generated.csv | grep "gen-locations" | grep "Q-60" > plots/tacas2024-gen-locations-q60.csv

less plots/tacas2024-summary-generated.csv | grep "gen-actions" | grep "A-2" > plots/tacas2024-gen-actions-a2.csv
less plots/tacas2024-summary-generated.csv | grep "gen-actions" | grep "A-4" > plots/tacas2024-gen-actions-a4.csv
less plots/tacas2024-summary-generated.csv | grep "gen-actions" | grep "A-6" > plots/tacas2024-gen-actions-a6.csv
less plots/tacas2024-summary-generated.csv | grep "gen-actions" | grep "A-8" > plots/tacas2024-gen-actions-a8.csv
less plots/tacas2024-summary-generated.csv | grep "gen-actions" | grep "A-10" > plots/tacas2024-gen-actions-a10.csv

less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.20" > plots/tacas2024-gen-registers-r020.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.40" > plots/tacas2024-gen-registers-r040.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.60" > plots/tacas2024-gen-registers-r060.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.80" > plots/tacas2024-gen-registers-r080.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-1.00" > plots/tacas2024-gen-registers-r100.csv

less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.20" > plots/tacas2024-gen-registers-n-r020.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.40" > plots/tacas2024-gen-registers-n-r040.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.60" > plots/tacas2024-gen-registers-n-r060.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.80" > plots/tacas2024-gen-registers-n-r080.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-1.00" > plots/tacas2024-gen-registers-n-r100.csv

head -n 1 plots/tacas2024-summary-generated.csv > plots/dtls-models-mc.csv
less plots/tacas2024-summary-generated.csv | grep "dtls-baseline-eq" >> plots/dtls-models-mc.csv

cd plots

latexmk boxplot-gen-locations.tex
latexmk boxplot-gen-actions.tex
latexmk boxplot-gen-registers.tex
latexmk boxplot-gen-registers-noopt.tex

latexmk plot-dtls-resets.tex
latexmk plot-dtls-counterexamples.tex
latexmk plot-dtls-wct.tex

cd ..