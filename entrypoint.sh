#!/bin/bash
set -e

api_url="https://pokeapi.co/api/v2/pokemon/${INPUT_POKEMON_ID}"
echo $api_url

pokemon_name=$(curl "${api_url}" | jq ".name")
pokemon_front=$(curl "${api_url}" | jq ".sprites.front_default")
echo $pokemon_name
echo $pokemon_front

# In order to create an output for our Action, we need to use a GitHub Action-specific syntax
# echo "::set-output name=<output name>::<value>"
echo "::set-output name=pokemon_name::$pokemon_name"
echo "::set-output name=pokemon_front::$pokemon_front"