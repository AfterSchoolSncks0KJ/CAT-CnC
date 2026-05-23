#  CAT-CnC v2.5

> Custom CNC project with automated Ubuntu 24.04 server setup.

## Overview

CAT-CnC v2.5 is a custom CnC project designed to run on Ubuntu 24.04
This repository includes an automated setup script to simplify installation and deployment.

## Features

- Automated installation using `setup.sh`
- Optimized for Ubuntu 24.04
- Simple deployment on a VPS or dedicated server
- Minimal manual configuration required

## Requirements

Before you begin, make sure you have:

- A Brain
- A VPS or dedicated server
- Ubuntu 24.04
- `sudo` privileges
- Basic Linux command-line knowledge
- Internet connection for package installation
- `git` installed or installable

## Quick Start

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git -y
git clone https://github.com/AfterSchoolSncks0KJ/CAT-CnC.git
cd CAT-CnC
sudo bash setup.sh
