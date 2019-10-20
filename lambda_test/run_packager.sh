#!/bin/bash -x
# Package our code for lambda
find . -type d -name __pycache__ -exec rm -rf {} \;
zip -r9 lambda_test.zip .
