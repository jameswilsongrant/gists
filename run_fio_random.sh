#!/bin/bash
# https://arstechnica.com/gadgets/2020/02/how-fast-are-your-disks-find-out-the-open-source-way-with-fio/
fio --name=random-write --ioengine=posixaio --rw=randwrite --bs=4k --size=4g --numjobs=1 --iodepth=1 --runtime=60 --time_based --end_fsync=1
