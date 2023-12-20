# Artifact Evaluation Readme

This file details how to perform artifact evaluation. See the
`README.md` accompanying the artifact for a more general
explanation.

The artifact can replicate the data presented in Table 1 as well
as Figures 4 and 5 that is discussed in Section 6.
Note that timing data is heavily machine-dependent,
although the relative timings should be reproducible.

## General Setup

For both early light and full review, setup must be performed.
All dependencies are included with this artifact, i.e.,
no network connection is required.
First, the system dependencies need to be installed.
When prompted, enter the sudo password (same as username). This
will take some minutes.

```
./install-deps.sh
```

Next, build the RaLib package. No administrative priviliges are
requires. This will also take some minutes, especially during unit testing.

```
./build.sh
```

## Reproducing Experimental Data

Three scripts are provided that regenerate the experimental
output data in `results/`. Initially, this directory will
contain data produced by us which will be overwritten. If some
of the scripts are not run, our data will be used in the respective
parts of the table and figures.

The experiments can be re-run using:
```
./run-experiments-model-checker-tacas2024.sh
./run-experiments-with-ce-search-tacas2024.sh
./run-big-experiments-with-ce-search-tacas2024.sh
```

The first command uses model checking to find counterexamples
and should complete in TODO. It generates the data presented
in the top six lines of Table 1 as well as both Figures.
**Only performing this step is recommended for early light evaluation.**

The second command uses slower counterexample search and should
complete in TODO. It generates the data presented in lines 7 and 8
of Table 1.

The third command uses counterexample search on larger models
and may time out on mid-end machines after TODO. It generates
the data presented in line 9 of Table 1.

## Reproducing Table and Figures

The plots can be re-rendered using two scripts
```
./generate-table-tacas2024.sh
./generate-plots-tacas2024.sh
```

This will take some minutes. The plots will be generated from all
data present in `results/`, i.e., if some experiment scripts were
not run, they will include our data.

The generated files that match table and figures are:

1. `plots/tacas2024-table-results.pdf`, which should match Table 1.
   Some extraneous data will be included and the experiment names
   will slightly differ.
2. `plots/plot-dtls-resets.pdf`, which should match Figure 4(a).
3. `plots/plot-dtls-resets-noopt.pdf`, which should match Figure 4(b).
4. `plots/plot-dtls-counterexamples.pdf`, which should match Figure 4(c).
5. `plots/plot-dtls-wct.pdf`. which should match Figure 4(d).
6. `plots/plot-gen-transitions.pdf`, which should match Figure 5(a).
7. `plots/plot-gen-registers.pdf`, which should match Figure 5(b).
8. `plots/plot-gen-registers-noopt.pdf`, which should match Figure 5(c).

Note that some additional files were not included in the paper.

## Source Code

The full source code of the tool is available in the `ralib/` directory.
Source code for dependencies provided by Ubuntu or Maven Central is not
provided.
