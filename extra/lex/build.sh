#!/bin/bash

lex $1
cc -o "$1.out" lex.yy.c -c
cc -o "$1.out" "$1.out" -ll
chmod +x "$1.out"
