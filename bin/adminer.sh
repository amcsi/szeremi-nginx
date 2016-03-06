#!/bin/bash

docker run -d --name adminer -e VIRTUAL_HOST=adminer.szeremi.org clue/adminer
