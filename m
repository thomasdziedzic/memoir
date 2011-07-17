#!/usr/bin/env python3

import time
import os
import sys

# add the current local time to the entry header
lines = [ time.asctime() + '\n' ]

if len( sys.argv ) > 1:
    lines.append( ' '.join( sys.argv[ 1: ] ) )
    lines[-1] += '\n'
else:
    while 1:
        try:
            line = input()
        except EOFError:
            break

        # get more user input until an empty line
        if len( line ) == 0:
            break
        else:
            lines.append( line + '\n' )


# only write the entry if the user entered something
if len( lines ) > 1:
    memoir_path = os.path.expanduser( '~/.memoir' )

    # prepend a seperator only if the file exists ( there are entries already in there )
    if os.path.exists( memoir_path ):
        lines.insert( 0, '--------------------\n' )

    with open( memoir_path, 'a' ) as f:
        f.writelines( lines )
