#!/bin/bash

all:
	ocamlc -c size.mli
	ocamlopt size.ml -o size.native

.PHONY: all