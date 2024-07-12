# nimhw

A [H🌍](https://esolangs.org/wiki/H%F0%9F%8C%8D) implementation written in Nim.

## Features

* Interpreter
* "Compiler"
  requires nim installed
* Interactive shell, also known as REPL

## Installation

1. Install [Nim](https://nim-lang.org/install.html).
1. Install nimhw via Nimble using `git clone https://github.com/Rico040/nimhw` and `nimble install`
1. Have fun i guess.

## Usage
```
nimhw [options] inputfile
  if no aren't specified it'll turn into REPL
Options:
  --help -h                     prints this message
  --eval -e:code                evaluates code
  -c                     compiles code
  ```