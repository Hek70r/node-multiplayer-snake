#!/bin/bash

# Zatrzymaj i usuń kontenery zaczynające się na "snake_"
docker stop $(docker ps -aq --filter name="snake_*")
docker rm $(docker ps -aq --filter name="snake_*")