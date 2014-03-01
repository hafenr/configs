#!/usr/bin/env python
import os
from optparse import OptionParser

usage = "Usage: %prog [options]"

# Parse command line arguments
p = OptionParser(usage=usage)
p.add_option(
    "-c", "--create-links", help="create links to dot files (the thing this script is supposed to do)",
    action="store_true", default=False, dest="create")
p.add_option(
      "--overwrite", help="overwrite existing files in the home directory. WARNING: THIS WILL DELETE YOUR FILES!",
    action="store_true", default=False, dest="overwrite")

(options, args) = p.parse_args()

if options.create:
    dir_abspath = os.path.dirname(os.path.realpath(__file__))

    # For each file in the directory where this script is located
    for f in os.listdir(dir_abspath):
        # Skip this script
        if f != os.path.basename(__file__):
            source = os.path.expanduser("~/." + f)
            target = os.path.join(dir_abspath, f)

            if os.path.exists(source) and options.overwrite:
                os.system("rm " + source)

            if not os.path.exists(source):
                print("Create: %s --> %s" % (source, target))
                cmd = "ln -s %s %s" % (target, source)
                os.system(cmd)
            else:
                print("%s exists already. Not overwriting." % source)
    print("Finished!")
else:
    p.print_help()
