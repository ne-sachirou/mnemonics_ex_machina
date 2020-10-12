defmodule Mnemonics.ExMachina.Example do
  @moduledoc false

  use Mnemonics, table_name: :examples

  defstruct id: 0,
            name: ""

  def create_ets do
    fn ->
      table = :ets.new(:examples, [{:read_concurrency, true}])
      :ok = :ets.tab2file(table, '/tmp/mnemonics_ex_machina/examples.ets')
      :ets.delete(table)
    end
    |> Task.async()
    |> Task.await()
  end
end
