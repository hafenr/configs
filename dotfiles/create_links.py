#!/usr/bin/env python

import os

dir_abspath = os.path.dirname(os.path.realpath(__file__))

for f in os.listdir(dir_abspath):
    if f != os.path.basename(__file__):
        source = "~/." + f
        target = os.path.join(dir_abspath, f)

        print("Creating link from %s to %s" % (source, target))

        cmd = "ln -s %s %s" % (target, source)
        os.system(cmd)

print("Done!")
