# RaLib Benchmarking Setup

This project contains benchmark examples and scripts to
run RaLib on these benchmarks. The project is organized
as follows:

1. **benchmark problems** are located in ```benchmarks/```.
    Problems are collected from papers on RaLib, from the
    [automata wiki](https://automata.cs.ru.nl), and some
    are generated or manually created for this project.
2. **configurations** of RaLib are located in ```configs/```.
    The different configurations are used in different
    series of experiments and specify aspects of the
    learning experiments (how counterexamples are found,
    how counterexamples are preprocessed, max. runtimes,
    teachers/theories for types, etc.).
3. **experiments** are organized in series in ```experiments/```.
    Series combine benchmark problems with a configuration.
    The different series in this project originate from
    multiple papers on RaLib / register automata learning.
4. **results** from running experiments will be stored in 
    ```results/```. Results include logs and models from 
    individual learning experiments. Some scripts will 
    use the results to compute plots and tables. 
    Templates and generated documents can be found
    in ```plots```.
5. **RaLib** is a git submodule in ```ralib/```.


## RaLib Installation

To install RaLib, you have to initialize the submodule 
and build RaLib, which requires a JDK and Maven to be 
installed.

```
./build.sh
```

## Running experiments 

Generally, experiments are organized in series and 
configurations do not specify which learner should 
be used or how many times experiments should be run.
Shell scripts exist for running individual experiments,
series, and complete evaluations.

### Experiments for the evaluation of CT-based learners (TACAS'24)

This section describes how one can run the experiments 
that are reported in the TACAS 2024 submission.
Concrete results may vary a little bit for every 
execution due to randomization but trends should be
stable.

1. Running experiments from TACAS 2024 submission

    ```
    ./run-experiments-model-checker-tacas2024.sh
    ./run-experiments-with-ce-search-tacas2024.sh
    ```

    results (logs and models) can be found in ```results/```.


2. Generating table in TACAS 2024 submission

    this step requires latexmk and a latex distribution
    to be installed

    ```
    ./generate-table-tacas2024.sh
    ```

    The generated PDF is ```plots/tacas2024-table-results.pdf```

    *Note:* The generated PDF has more rows and columns
    than the table in the paper.

2. Generating plots

    this step requires latexmk and a latex distribution
    with pgfplots to be installed

    ```
    ./generate-plots-tacas2024.sh
    ```

    The plots in Fig. 4. are:

    ```
    plots/plot-dtls-resets.pdf
    plots/plot-dtls-resets-noopt.pdf
    plots/plot-dtls-counterexamples.pdf
    plots/plot-dtls-wct.pdf
    ```

    The plots in Fig. 5 are

    ```
    plots/plot-gen-transitions.pdf
    plots/plot-gen-registers.pdf
    plots/plot-gen-registers-noopt.pdf
    ```

    *Note:* Some additional plots that are generated
    were not included in the paper.

### Running individual experiments

```
./run_experiment.sh [-h] -s series -e experiment -i iterations -l learner
```

Learn model of `experiments/[series]/[experiment].xml` with config
`experiments/[series]/config` and specified learner. Each `series`
corresponds to a subdirectory of `experiments/`, each experiment to
a XML file in a `series`.

### Running a series

```
./run_series.sh [-h] -s series -i iterations -l learner
```

Run the series of experiments (i.e., all XML files) specified in the
directory `experiments/[series]` with the specified learner.

### Running the complete evaluation (2015 RaLib Paper)

```
./run_evaluation.sh
```

This script contains explicit calls to `run_series.sh` for
all experiments that are to be run as part of the evaluation.


### Searching in logs

```
./search_logs.sh series experiment learner search_term
```

Searches for `search_term` in the logs from all iterations.

