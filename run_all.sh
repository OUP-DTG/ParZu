#!/bin/bash

SUBFOLDER=$1
YEAR=$2

INPUT_FOLDER=/home/ec2-user/data/postagged_data/$SUBFOLDER
OUTPUT_FOLDER="/home/ec2-user/data/morph_analysis/$YEAR"



for f in $INPUT_FOLDER/filtered_*.pos; do
    echo "processing file $f"
    fname="$(basename -- $f)"
    
    OUTPUT_FILE=$OUTPUT_FOLDER/$YEAR.$fname.parzu.morph
    if test -f "$OUTPUT_FILE"; then
	echo "$OUTPUT_FILE already exists"
    else
	./parzu --input tagged < $f > $OUTPUT_FILE 2> ./logs/$YEAR.$fname.parzu.err
    fi
done



