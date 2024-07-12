import os, strutils, strscans

proc escapeSpecialChars*(s: string): string =
    result = s.replace("\"", "\\\"")

proc removeFileExtension*(filePath: string): string =
    let (_, fileName, _) = splitFile(filePath)
    return fileName

proc extractVersion*(): string {.compileTime.} =
    let nimbleFile = staticRead("../nimhw.nimble")
    for line in splitLines(nimbleFile):
        if scanf(line, "version$s=$s\"$+\"", result): break
    assert '.' in result