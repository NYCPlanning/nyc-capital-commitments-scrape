#!/bin/sh

# Install pdftotext
apt update
apt install -y poppler-utils

# install node package 
yarn install

# start scraping
cd scripts {
    for folder in ../data/*; do
        echo "$folder"
        sh pdf-to-text.sh $folder/pdf
        node scrape $folder/txt
    done
cd -;}