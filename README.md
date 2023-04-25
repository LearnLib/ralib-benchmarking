# RaLib Benchmarking Setup

## Installation

```
./build.sh
```

## Scripts

### Running individual experiments

```
run_experiment.sh [-h] -s series -e experiment -i iterations -l learner
```

Learn model of `experiments/[series]/[experiment].xml` with config
`experiments/[series]/config` and specified learner.

### Running a series

```
run_series.sh [-h] -s series -i iterations -l learner
```

Run the series of experiments specied in folder
`experiments/[series]` with specified learner.

### Running the complete evaluation

```
run_evaluation.sh
```

This script contains explicit calls to `run_series.sh` for
all experiments that are to be run as part of the evaluation.

### Searching in logs

```
search_logs.sh series experiment learner search_term
```

Searches for `search_term` in the logs from all iterations.

