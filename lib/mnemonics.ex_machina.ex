defmodule Mnemonics.ExMachina do
  @moduledoc """
  """

  defmacro __using__(_opts) do
    quote do
      {:ok, _} = Application.ensure_all_started(:mnemonics)
      use ExMachina
      use Mnemonics.ExMachina.Strategy
    end
  end
end
