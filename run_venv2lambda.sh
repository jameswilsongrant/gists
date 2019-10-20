#!/bin/bash
# Lambda is too stupid to use virtualenv so you have to move everything around manually
# https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html
mv venv/lib/python3.5/site-packages/* .
rm -rf __pycache__/
mv venv/lib/python3.5/site-packages/* .
rm -rf __pycache__/
rm -rf venv/
