app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.10.0/vNe6s9hWzoTZtFmNkvEICPErI9ptji_ySjicO6CkucY.tar.br" }

import pf.Stdout
import pf.Task

import pf.Stdout
import pf.Stdin
import pf.Task

main =
    Stdout.line! "What day would you like to run the morning routine for?"
    # Important for Swift devs:
    #
    # The ! suffix is **not** related with optionality—roc has no concept of nil.
    #
    # The suffix desugars Task.await.
    #
    # Task.await (Stdout.line "Type in something and press Enter:") \_ ->
    #     Task.await Stdin.line \input ->
    #         Stdout.line "Your input was: $(input)"
    day = Stdin.line!
    Stdout.line! "Will run for: $(day)"
