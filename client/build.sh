#!/bin/bash
mkdir out
cp src/html/* out/
elm-format --yes src/elm/*
elm make src/elm/Main.elm --output out/main.js
