import vim
import os

colorschemes = []
current_colorscheme_position = 0

def nextcolorscheme(incrementstr):
    increment = int(incrementstr)
    if colorschemes:
        global current_colorscheme_position
        current_colorscheme_position += increment
        scheme = colorschemes[current_colorscheme_position % len(colorschemes)]
        vim.command(":colo %s" % scheme)
        vim.command(':echomsg "%s"' % scheme)
    else:
        home = os.path.expanduser("~")
        vimhomedir = os.path.join(home, ".vim")

        for root, dirs, files in os.walk(vimhomedir, followlinks=True):
            for dir in dirs:
                if dir == 'colors':
                    colordirpath = os.path.abspath(os.path.join(root, dir))
                    for file in os.listdir(colordirpath):
                        if file.endswith(".vim"):
                            colorschemes.append(os.path.splitext(file)[0])

        nextcolorscheme(increment)


