# Package

version       = "0.1.1"
author        = "Rico040"
description   = "H🌍 (HWorld) interpreter written in Nim."
license       = "MIT"
srcDir        = "src"
bin           = @["nimhw"]


# Dependencies

requires "nim >= 2.0.8"

task test, "Run all tests":
    exec "testament --megatest:off all"
