#!/bin/bash

# Local XCompose must change for included files to be picked up by ibus
sed -i '1i # Touched to update for Omakub defaults [5/2/2025]' ~/.XCompose
ibus restart
