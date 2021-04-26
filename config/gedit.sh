#!/bin/bash

DIR=$HOME/.local/share/gtksourceview-4.0/styles

mkdir -p $DIR

cp config/pop-light.xml $DIR
cp config/pop-dark.xml  $DIR
