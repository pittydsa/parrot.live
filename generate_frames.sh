#!/usr/bin/env bash

source_file=$1

mkdir target -p && \
  mkdir frames -p && \
  rm -rf frames/* && \
  rm -rf target/* && \
  convert -coalesce ${source_file} target/_.jpg && \
  for f in target/*.jpg; do \
    echo "ascii-fying $f"; \
    jp2a -i --height=23 --chars="..00xx@@" "${f}" \
      > "frames/$(echo "$f" | sed 's/[^0-9]*//g').txt"; \
  done;
