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

__USAGE="\
Usage: bash setup.sh [OPTIONS]

Options:
    -h, --help      Print this help message.
    -s, --setup     Setup the system for the workshop.\
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

function system_info () {
    echo -e "$INFO Checking system environment variables ..."
    echo -e "PATH: \e[1m$PATH\e[0m ..."
    echo -e "Distro: \e[1m$(uname -a)\e[0m"
}

function update_system () {
    echo -e "$INFO Updating system ..."
    sudo apt-get update         && \
    sudo apt-get upgrade -y     && \
    sudo apt autoremove -y      && \
    sudo apt clean -y
    echo -e "$INFO Successfully updated the system."
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

    echo -e "$INFO Checking requirements ..."
    for _util in ${utils[@]}; do
        if [[ $_util == p\_* ]]; then
            echo -e "Checking python library: \e[1m$_util\e[0m ..."
            if [ python -c "import $_util" &> /dev/null ]; then
                echo -e "\t=> Installed: \e[1m$_util\e[0m ..."
            else
                echo -e "\t=> \e[1m$_util\e[0m not installed ..."
                not_installed+=("$_util")
            fi
        else
            echo -e "Checking package: \e[1m$_util\e[0m ..."
            if [[ -x "$(command -v $_util)" ]]; then
                echo -e "\t=> Found \e[1m$_util\e[0m in PATH ..."
            else
                echo -e "\t=> \e[1m$_util\e[0m is not in PATH ..."
                not_installed+=("$_util")
            fi
        fi
    done

    echo -e "$INFO The following packages are not installed:"
    for _ni in ${not_installed[@]}; do
        echo -e "\t$_ni"
    done
    echo -e "$INFO Finished checking all the libraries and packages ..."
}

function install_missing () {
    echo -e "$INFO Installing missing libraries and packages ..."
    for _ni in ${not_installed[@]}; do
        echo -e "Installing: \e[1m$_ni\e[0m ..."

        if [[ $_ni == p\_* ]]; then
            package="${_ni:2}"
            echo -e "\t=> PIP: Installing \e[1m$package\e[0m ..."
            pip3 install $package
        else
            echo -e "\t=> APT: Installing \e[1m$package\e[0m ..."
            sudo apt-get install $package
        fi
    done
    echo -e "$SUCCESS Successfully installed all packages."
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
