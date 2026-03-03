#!/usr/bin/bash

cd lab0
wc -m samurott5/* 2>&1 | grep -v " total$" | grep -E '^[[:space:]]*[0-9]+' | sort -nr

ls -lRpuD "%Y-%m-%d %H:%M" 2>/tmp/err | grep -E '^-.*[0-9]{2}:[0-9]{2} s\S*' | sort -k6n -k8

cat *r */*r */*/*r 2>/tmp/err_2 | sort -r

ls -LRlpD "%Y-%m-%d %H:%M" 2>&1 | grep -E "^-.*[0-9]{2}:[0-9]{2} p\S*" | head -n 4 | sort -k6n -k7

cd simisear1
cat simisear1/* 2>/dev/null | sort -r
cd ..

wc -l samurott5/* 2>/dev/null | grep -v " total$" >/tmp/last

ls -LRla ~| grep -E "^[^d]" | grep -E "[a-zA-Z][0-9]{2}[a-zA-Z]"