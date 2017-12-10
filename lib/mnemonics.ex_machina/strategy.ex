defmodule Mnemonics.ExMachina.Strategy do
  @moduledoc """
  """

  use ExMachina.Strategy, function_name: :insert

  def handle_insert(record, _opts) do
    memory = record.__struct__.table
    GenServer.call memory.pid, {:write, fn memory -> :ets.insert memory.tid, {record.id, record} end}
    record
  end
end
