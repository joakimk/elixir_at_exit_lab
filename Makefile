all:
	gcc -undefined dynamic_lookup -dynamiclib at_exit.c -o at_exit.so -I /usr/local/Cellar/erlang/18.1/lib/erlang/usr/include
	elixir lab.ex
