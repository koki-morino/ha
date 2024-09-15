#!/bin/bash

sudo add-apt-repository -y ppa:linbit/linbit-drbd9-stack
sudo apt-get update
sudo apt-get install -y drbd-utils drbd-dkms
