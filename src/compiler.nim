import os, std/strformat, strutils
import runner
import utils

proc compile*(filename: string) =
    let fc = readFile(filename)
    let lines = fc.splitLines()
    let filename2 = filename.removeFileExtension()
    let fw = open(fmt"{filename2}.nim", fmWrite)
    defer: fw.close()

    echo "Generating code..."
    for line in lines:
        if line != "q":
            fw.writeLine(fmt"echo ""{escapeSpecialChars(run(line))}""")
        else:
            fw.writeLine("quit(0)")
    fw.close()
    
    echo "Compiling..."
    discard execShellCmd(fmt"nim c -d:release --verbosity:0 --opt:size .\{filename2}.nim")
    removeFile(fmt"{filename2}.nim")
    echo "Done."
