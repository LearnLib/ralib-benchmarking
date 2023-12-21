#!/usr/bin/env bash

./compare-learners.sh -h

./compare-learners.sh ct-with-rwalk abp_output
./compare-learners.sh ct-with-rwalk abp_receiver3
./compare-learners.sh ct-with-rwalk channel_frame
./compare-learners.sh ct-with-rwalk login
./compare-learners.sh ct-with-rwalk sip
./compare-learners.sh ct-with-rwalk palindrome

./compare-learners.sh ct-datastructures fifo_size_3.register
./compare-learners.sh ct-datastructures fifo_size_5.register
./compare-learners.sh ct-big-datastructures fifo_size_7.register

