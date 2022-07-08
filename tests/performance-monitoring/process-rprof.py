#!/usr/bin/env python3
 
# run this like so:
#
# ./process-rprof.py RProf.out

import sys

f = list(f.strip() for f in open(sys.argv[1]))[1:] # skip the configuration declaration

calls = set()
total = {}
for l in f:
  in_this_line = set()
  for w in l.split(" "):
    in_this_line.add(w[1:-1])
  for w in in_this_line:
    total[w] = total.get(w, 0) + 1

for v in sorted(list(total.items()), key=lambda x: -x[1]):
  print("%s: %s" % (v[0], v[1]))

