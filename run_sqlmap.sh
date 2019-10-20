#!/bin/bash -x
sqlmap -u ${1} --fingerprint --forms --crawl=2 --random-agent
sqlmap -u ${1}/?id=1 --level=5 --risk=3 --random-agent
