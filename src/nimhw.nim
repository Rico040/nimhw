#
#
#      nimhw - H🌍 (HWorld) interpreter and "compiler" written in Nim.
#        (c) Copyright 2024 Rico040
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#
import std/[os, parseopt], strutils
import runner, compiler

const
  Usage = """
nimhw - H🌍 (HWorld) interpreter and "compiler" written in Nim.
  (c) Copyright 2024 Rico040
Usage: c2nim [options] inputfile
  if no aren't specified it'll turn into REPL
Options:
  --help -h                     prints this message
  --eval -e:code                evaluates code
  -c                     compiles code
"""

proc writeHelp() =
    echo Usage

var positionalArgs = newSeq[string]()
var code: string
var compileFlag = false

var optparser = initOptParser(quoteShellCommand(commandLineParams()))
if paramCount() == 0:
    #TODO - Translate user to REPL
    echo Usage
for kind, key, val in optparser.getopt():
    case kind
    of cmdArgument:
        positionalArgs.add(key)
    of cmdLongOption, cmdShortOption:
        case key
        of "help", "h": writeHelp()
        of "eval", "e":
            echo run(val)
        of "c":
            compileFlag = true
    of cmdEnd: assert(false) # cannot happen

if compileFlag:
    compile(positionalArgs[0])
if positionalArgs.len > 0 and not compileFlag:
    let contents = readFile(positionalArgs[0])
    let lines = contents.splitLines()
    for line in lines:
        echo run(line)
    

# echo "positionalArgs: ", positionalArgs
# echo "code: ", code