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
    -h, --help      Print this help message.
    -s, --setup     Setup the system for the workshop.
"

not_installed=()

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

function update_system () {
    echo -e "$INFO Updating system ..."
    sudo apt-get update         && \
    sudo apt-get upgrade -y     && \
    sudo apt autoremove -y      && \
    sudo apt clean -y
    echo -e "$INFO Successfully updated the system "
}

function check_requirements () {
    utils=(             \
        "python"        \
        "pip3"          \
        "git"           \
        "p_matplotlib"  \
        "p_numpy"       \
        "p_pandas"      \
        "p_vina"        \
        "p_pillow"      \
    )
    not_installed=()

    for _util in ${utils[@]}; do
        if [[ $_util == p\_* ]]; then
            echo -e "$INFO Checking python library: $_util ..."
            if [ python -c "import $_util" &> /dev/null ]; then
                echo -e "$SUCCESS $_util installed ..."
            else
                echo -e "$INVALID $_util not installed ..."
                not_installed+=("$_util")
            fi
        else
            echo -e "$INFO Checking package: $_util ..."
            if [[ -x "$(command -v $_util)" ]]; then
                echo -e "$SUCCESS $_util in PATH ..."
            else
                echo -e "$INVALID $_util not in PATH ..."
                not_installed+=("$_util")
            fi
        fi
    done

    echo -e "$INVALID The following packages are not installed:"
    for _ni in ${not_installed[@]}; do
        echo -e "    $_ni"
    done
}

function install_missing () {
    for _ni in ${not_installed[@]}; do
        echo -e "$INFO Installing: $_ni ..."

        if [[ $_ni == p\_* ]]; then
            package="${_ni:2}"
            pip3 install $package
        else
            sudo apt-get install $package
        fi
    done
}


check_requirements
