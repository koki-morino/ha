#!/bin/bash

sudo apt-get update
sudo apt-get install -y pcs pacemaker corosync

sudo systemctl enable pcsd
sudo systemctl enable corosync
sudo systemctl enable pacemaker
