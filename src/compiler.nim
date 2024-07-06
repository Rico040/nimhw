import os, std/strformat, strutils
import runner

proc escapeSpecialChars(s: string): string =
    result = s.replace("\"", "\\\"")

proc removeFileExtension(filePath: string): string =
    let (_, fileName, _) = splitFile(filePath)
    return fileName

proc compile*(filename: string) =
    let fc = readFile(filename)
    let lines = fc.splitLines()
    let fw = open(fmt"{filename.removeFileExtension()}.nim", fmWrite)
    defer: fw.close()

    echo "Generating code..."
    for line in lines:
        if line != "q":
            fw.writeLine(fmt"echo ""{escapeSpecialChars(run(line))}""")
        else:
            fw.writeLine("quit(0)")
    fw.close()
    
    echo "Compiling..."
    discard execShellCmd(fmt"nim c -d:release --verbosity:0 --opt:size .\{filename[0 .. filename.len-4]}.nim")
    removeFile(fmt"{filename.removeFileExtension()}.nim")
    echo "Done."
