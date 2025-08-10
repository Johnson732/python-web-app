#!/usr/bin/env bash
set -e

python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements-dev.txt
pip install -r requirements.txt

echo "Virtualenv created and dependencies installed. Activate with: source .venv/bin/activate"
