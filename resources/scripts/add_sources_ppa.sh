#!/bin/bash

curl -s --compressed --retry 4 --retry-max-time 60 --retry-all-errors "https://ctu-mrs.github.io/ppa-stable/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg > /dev/null
sudo curl -s --compressed --retry 4 --retry-max-time 60 --retry-all-errors -o /etc/apt/sources.list.d/ctu-mrs-stable.list "https://ctu-mrs.github.io/ppa-stable/ctu-mrs-apt.list"
sudo curl -s --compressed --retry 4 --retry-max-time 60 --retry-all-errors -o /etc/apt/preferences.d/ctu-mrs-stable-preferences "https://ctu-mrs.github.io/ppa-stable/ctu-mrs-ppa-preferences.txt"

sudo apt-get -o Acquire::Retries="4" update
