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

FAIL="\e[1;31m[ FAIL ]"
SUCCESS="\e[1;32m[ SUCCESS ]"

__USAGE="\
Usage: bash setup.sh [OPTIONS]

Options:
    -h, --help      Print this help message.
    -s, --setup     Setup the system for the workshop.\
"

not_installed=()

function setup_fail () {
    echo -e "$FAIL Setup failed for some reason."
    exit 1
}

function setup_success () {
    echo -e "$SUCCESS Setup finished."
    exit 0
}

function print_help () {
    echo -e "$__USAGE"
    exit 0
}

function system_info () {
    echo -e "=> checking system environment variables ..."
    echo -e "PATH: $PATH ..."
    echo -e "Distro: $(uname -a)"
}

function update_system () {
    echo -e "=> updating system ..."
    sudo apt-get update         && \
    sudo apt-get upgrade -y     && \
    sudo apt autoremove -y      && \
    sudo apt clean -y
    echo -e "updated the system."
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

    echo -e "=> checking requirements ..."
    for _util in ${utils[@]}; do
        if [[ $_util == p\_* ]]; then
            echo -e "checking python library: $_util ..."
            if [ python -c "import $_util" &> /dev/null ]; then
                echo -e "    installed: $_util ..."
            else
                echo -e "    $_util not installed ..."
                not_installed+=("$_util")
            fi
        else
            echo -e "checking package: $_util ..."
            if [[ -x "$(command -v $_util)" ]]; then
                echo -e "    Found $_util in \$PATH ..."
            else
                echo -e "    $_util not in \$PATH ..."
                not_installed+=("$_util")
            fi
        fi
    done

    echo -e "=> the following packages are not installed:"
    for _ni in ${not_installed[@]}; do
        echo -e "    $_ni"
    done
    echo -e "checked all the libraries and packages."
}

function install_missing () {
    echo -e "=> installing missing libraries and packages ..."
    for _ni in ${not_installed[@]}; do
        echo -e "installing: $_ni ..."

        if [[ $_ni == p\_* ]]; then
            package="${_ni:2}"
            echo -e "    pip: $package ..."
            pip3 install $package
        else
            echo -e "    apt: $package ..."
            sudo apt-get install $package
        fi
    done
    echo -e "successfully installed all packaSUCCESSges."
}

function setup () {
    system_info         && \
    update_system       && \
    check_requirements  && \
    install_missing     || \
    setup_fail
    setup_success
}

while true; do
    case "$1" in
        -h | --help )
            print_help;
            break;;
        -s | --setup )
            setup;
            break;;
        -- )
            echo -e "$INVALID Please select an option.";
            break;;
    esac
done
