# Pulled these two examples together for the following code
# http://docs.python.org/2/library/rlcompleter.html#module-rlcompleter
# http://geoffford.wordpress.com/2009/01/20/python-repl-enhancement/

try:
    import readline
    import rlcompleter
    import atexit
    import os
    import sys
    import platform
    import pprint
except ImportError as exception:
    print('Shell Enhancement module problem: {0}').format(exception)
else:
    # Enable Tab Completion
    # OSX's bind should only be applied with legacy readline.
    if sys.platform == 'darwin' and 'libedit' in readline.__doc__:

        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")

    # Enable History File
    history_file = os.environ.get("PYTHON_HISTORY_FILE",
                                  os.path.join(os.environ['HOME'],
                                               '.python_history'))

    if os.path.isfile(history_file):
        readline.read_history_file(history_file)
    else:
        open(history_file, 'a').close()

    atexit.register(readline.write_history_file, history_file)

    # Enable pretty printing for stdout.
    def display_hook(value):
        """ Pretty-print provided value. """
        if value is not None:
            try:
                import __builtin__
                __builtin__._ = value
            except ImportError:
                global _
                _ = value
            pprint.pprint(value)
    sys.displayhook = display_hook

    print(
        'Persistent session history, tab completion and pretty printing are'
        ' enabled.')
