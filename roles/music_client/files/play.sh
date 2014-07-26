#!/bin/bash

host=music
port=8000

mpc volume 90
mpc clear
mpc add "http://$host:$port"
mpc play
