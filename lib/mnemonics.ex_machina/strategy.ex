defmodule Mnemonics.ExMachina.Strategy do
  @moduledoc """
  ExMachina strategy for Mnemonics.
  """

  use ExMachina.Strategy, function_name: :insert

  @doc """
  `c:Mnemonics.ExMachina.insert/2` callback.
  """
  @spec handle_insert(any, keyword | map) :: any
  def handle_insert(record, _opts) do
    memory = record.__struct__.table

    GenServer.call(
      memory.pid,
      {:write, fn memory -> :ets.insert(memory.tid, {record.id, record}) end}
    )

    record
  end
end
