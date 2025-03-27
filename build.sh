#!/bin/bash

PLUGIN_NAME="ping-checker"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
