import std/[strformat, terminal]
import runner, utils

const
    Version = extractVersion()
    Commands = """
Command   Description
h         Prints "Hello!"
hh        "Hello, Hello!"
w         "World!"
ww        "World, World!"
hw        "Hello, World!"
wh        "World, Hello!"
q         Ends interpreting code"""
    Help = """
.commands Shows H🌍 commands
.help     Prints this message
.exit     Exit the REPL"""


var input: string

# This is also sucks ass and fucking stupid
proc initRepl*() =
    echo fmt"""
Welcome to nimhw v{Version}
Type ".help" for more information."""
    while true:
        write(stdout, "> ")
        input = readLine(stdin)
        case input:
            of ".help":
                echo Help
            of ".commands":
                echo Commands
            of ".exit":
                quit()
            else:
                styledEcho fgYellow, run(input)
