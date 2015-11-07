#include "erl_nif.h"
#include <stdio.h>
#include <stdlib.h>

void cleanup(void) {
  puts("cleanup at exit!");
}

static ERL_NIF_TERM register_at_exit(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    atexit(cleanup);
    return enif_make_string(env, "ok", ERL_NIF_LATIN1);
}

static ErlNifFunc nif_funcs[] =
{
    {"register_at_exit", 0, register_at_exit}
};

ERL_NIF_INIT(Elixir.AtExit, nif_funcs, NULL, NULL, NULL, NULL)
