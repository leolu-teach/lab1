#!/usr/bin/env bash
# ACS730 Lab 1 — Install course tools on Amazon Linux 2023
set -euo pipefail

log() { echo "[$(date +%H:%M:%S)] $*"; }

log "Updating system packages..."
sudo dnf update -y

log "Installing git and python3..."
sudo dnf install -y git python3-pip

log "Installing OpenTofu..."
curl --proto '=https' --tlsv1.2 -fsSL \
  https://get.opentofu.org/install-opentofu.sh | sudo sh

log "Installing pre-commit..."
pip3 install --user pre-commit

log "Installing ansible-lint (used from Week 8)..."
pip3 install --user ansible ansible-lint

log "Verifying installations..."
git --version
tofu --version
pre-commit --version

log "Done! Run 'pre-commit install' in your repo directory."
