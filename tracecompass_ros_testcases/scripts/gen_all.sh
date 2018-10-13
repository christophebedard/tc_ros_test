#!/bin/bash
## Generate all test traces
./${BASH_SOURCE%/*}/gen_pub_sub_1.sh
./${BASH_SOURCE%/*}/gen_pub_sub_10.sh
./${BASH_SOURCE%/*}/gen_pub_sub_latching.sh
./${BASH_SOURCE%/*}/gen_multi_instances.sh
