#!/bin/sh

./generate-summary-generated-models-tacas2024.sh > plots/tacas2024-summary-generated.csv

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

less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.10" > plots/tacas2024-gen-registers-r10.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.20" > plots/tacas2024-gen-registers-r20.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.30" > plots/tacas2024-gen-registers-r30.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.40" > plots/tacas2024-gen-registers-r40.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers" | egrep -v "noopt" | grep "R-0.50" > plots/tacas2024-gen-registers-r50.csv

less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.10" > plots/tacas2024-gen-registers-n-r10.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.20" > plots/tacas2024-gen-registers-n-r20.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.30" > plots/tacas2024-gen-registers-n-r30.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.40" > plots/tacas2024-gen-registers-n-r40.csv
less plots/tacas2024-summary-generated.csv | grep "gen-registers-noopt" | grep "R-0.50" > plots/tacas2024-gen-registers-n-r50.csv

cd plots

latexmk boxplot-gen-locations.tex
latexmk boxplot-gen-actions.tex
latexmk boxplot-gen-registers.tex
latexmk boxplot-gen-registers-noopt.tex

cd ..