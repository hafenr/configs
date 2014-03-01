#!/usr/bin/env python

import os

dir_abspath = os.path.dirname(os.path.realpath(__file__))

for f in os.listdir(dir_abspath):
    if f != os.path.basename(__file__):
        source = os.path.expanduser("~/." + f)
        target = os.path.join(dir_abspath, f)

        if not os.path.exists(source):
            print("Create: %s --> %s" % (source, target))
            cmd = "ln -s %s %s" % (target, source)
            os.system(cmd)
        else:
            print("%s exists already. Not overwriting." % source)

print("Done!")
