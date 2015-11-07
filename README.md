Simple example of how to execute code on ctrl+c in Elixir by using a c-extension. Just to see if it worked.

    make

If you clean this up and add proper mix-hooks, etc. Ping me and I'll link to your implementation. Or send a pull request :)


## When letting it run

Both exit handlers are run.

    $ make
    gcc -undefined dynamic_lookup -dynamiclib at_exit.c -o at_exit.so -I /usr/local/Cellar/erlang/18.1/lib/erlang/usr/include
    elixir lab.ex
    Hello! Will exit in 1 second.
    Will exit.
    Did exit!
    cleanup at exit!

## When pressing ctrl+c

Only the c-extension exit handler is run.

    $ make
    gcc -undefined dynamic_lookup -dynamiclib at_exit.c -o at_exit.so -I     /usr/local/Cellar/erlang/18.1/lib/erlang/usr/include
    elixir lab.ex
    Hello! Will exit in 1 second.
    ^C
    BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
           (v)ersion (k)ill (D)b-tables (d)istribution
    ^Ccleanup at exit!
