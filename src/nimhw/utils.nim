import os, strutils, strscans

proc escapeSpecialChars*(s: string): string =
    result = s.replace("\"", "\\\"")

proc removeFileExtension*(filePath: string): string =
    let (fileDir, fileName, _) = splitFile(filePath)
    if fileDir != "":
        return fileDir & "/" & fileName
    else:
        return fileName
    

proc extractVersion*(): string {.compileTime.} =
    let nimbleFile = staticRead("../../nimhw.nimble")
    for line in splitLines(nimbleFile):
        if scanf(line, "version$s=$s\"$+\"", result): break
    assert '.' in result
