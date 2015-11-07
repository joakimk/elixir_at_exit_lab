defmodule AtExit do
  @on_load :register

  def register do
    :ok = :erlang.load_nif("./at_exit", 0)
    register_at_exit
    :ok
  end

  def register_at_exit do
    raise "Will not be called if c function is loaded"
  end
end

spawn_link fn ->
  Process.flag(:trap_exit, true)

  receive do
    {:EXIT, _, _} -> IO.puts("Did exit!")
  end
end


IO.puts "Hello! Will exit in 1 second."
:timer.sleep 1000
IO.puts "Will exit."
