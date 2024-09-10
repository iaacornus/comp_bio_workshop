#!/usr/bin/env bash

# ---------------------------------
#
# Setup Script for Computational Biology Workshop 2024 at
# Biotechnology and Analytical Laboratory, Central Luzon
# State University, Science City of Munoz, Nueva Ecija
#
# Copyright (c)  2024 James Aaron Erang <erang.james@clsu2.edu.ph>
#
# ---------------------------------

FAIL="\e[1;31m[ FAIL ]\e[0m"
INVALID="\e[1;31m[ INVALID ]\e[0m"
SUCCESS="\e[1;32m[ SUCCESS ]\e[0m"
INFO="\e[1;34m[ INFO ]\e[0m"

__USAGE="
Usage: bash setup.sh [OPTIONS]

Options:
    -h, --help              Print this help message.
    -a, --all               Apply all of the recommended modifications on the system.
    -f, --flatpak           Setup flatpak repository.
    -r, --rpmfusion         Setup RPMFusion repository.
    -c, --codecs            Install codecs.
    -d, --driver            Install appropriate drivers.
    -m, --msfonts           Install Micro\$oft fonts.
    -l, --laptop            Apply laptop recommendations.
    -o, --optimize          Perform suggested system optimizations.
    -n, --nvidia            Install proprietary NVidia drivers.
"

function setup_fail () {
    echo -e "$FAIL Installation failed for some reason."
    exit 1
}

function setup_success () {
    echo -e "$SUCCESS Installation successfully finished."
    exit 0
}

function print_help () {
    echo -e "$__USAGE"
    exit 0
}
