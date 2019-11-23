#!/bin/bash

# https://vim.fandom.com/wiki/C%2B%2B_code_completion
# Create stdc++ tags: from the modified libstdc++ headers to ~/.vim/tags/cpp_src
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp /home/yoo/.vim/tags/cpp_scr/ .  # for cpp
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cairo /usr/include/cairo/           # for cairo
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gtkmm /usr/include/gtkmm-3.0/gtkmm/ # for gtkmm
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gtk //usr/include/gtk-3.0/gtk/      # for gtk3
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gdk /usr/include/gtk-3.0/gdk/       # for gdk3
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f glib /usr/include/glib-2.0/         # for glib


#/usr/include/boost
