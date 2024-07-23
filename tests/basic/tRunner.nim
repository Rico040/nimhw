discard """
  
  output: '''
Hello!
Hello, Hello!
World!
World, World!
Hello, World!
World, Hello!
quine
'''

"""
import ../../src/nimhw/runner
echo run("h")
echo run("hh")
echo run("w")
echo run("ww")
echo run("hw")
echo run("wh")
echo run("quine")
