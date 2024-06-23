app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.10.0/vNe6s9hWzoTZtFmNkvEICPErI9ptji_ySjicO6CkucY.tar.br" }

import pf.Arg
import pf.Stdout
import pf.Task

main =
    finalTask =
        # Important for Swift devs:
        #
        # The ! suffix is **not** related with optionality—roc has no concept of nil.
        #
        # The suffix desugars Task.await.
        #
        # https://www.roc-lang.org/tutorial#the-!-suffix
        userInput = readFirstArgT!
        Stdout.line! "Will run for: $(userInput)"

    Task.mapErr finalTask \err ->
        when err is
            ZeroArgsGiven -> Exit 1 "Please provide at least one argument"
            StdoutErr _ -> Exit 2 "Error writing to stdout."

readFirstArgT : Task.Task Str [ZeroArgsGiven]_
readFirstArgT =
    # read all command line arguments
    args = Arg.list!

    # get the second argument, the first is the executable's path
    List.get args 1 |> Result.mapErr (\_ -> ZeroArgsGiven) |> Task.fromResult
