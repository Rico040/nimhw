# Evaluate some H🌍 code
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
