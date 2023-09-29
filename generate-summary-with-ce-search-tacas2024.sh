#!/bin/sh

./compare-learners.sh -h

./compare-learners.sh ct-with-rwalk abp_output
./compare-learners.sh ct-with-rwalk abp_receiver3
./compare-learners.sh ct-with-rwalk channel_frame
./compare-learners.sh ct-with-rwalk login
./compare-learners.sh ct-with-rwalk sip
./compare-learners.sh ct-with-rwalk palindrome

./compare-learners.sh ct-datastructures fifo_size_1.register
./compare-learners.sh ct-datastructures fifo_size_3.register
./compare-learners.sh ct-datastructures fifo_size_5.register

./compare-learners.sh dtls-twalk-eq hyp-4
./compare-learners.sh dtls-twalk-eq hyp-6
./compare-learners.sh dtls-twalk-eq hyp-8
./compare-learners.sh dtls-twalk-eq hyp-10
./compare-learners.sh dtls-twalk-eq hyp-12



