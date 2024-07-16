#!/bin/bash

# return device name and ip address of devices in tailscale network except the
# current device

devices=$(tailscale status --json)
