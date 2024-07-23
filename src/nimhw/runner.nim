# Evaluate some H🌍 code
# https://esolangs.org/wiki/H%F0%9F%8C%8D#Commands
proc run*(code: string): string =
    case code:
        of "h": return "Hello!"
        of "hh": return "Hello, Hello!"
        of "w": return "World!"
        of "ww": return "World, World!"
        of "hw": return "Hello, World!"
        of "wh": return "World, Hello!"
        of "q": quit(0)
        else: return code
