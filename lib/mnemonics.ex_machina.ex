defmodule Mnemonics.ExMachina do
  @moduledoc """
  ExMachina strategy for Mnemonics.
  """

  defmacro __using__(_opts) do
    quote do
      {:ok, _} = Application.ensure_all_started(:mnemonics)
      use ExMachina
      use Mnemonics.ExMachina.Strategy
    end
  end

  @doc """
  Builds a factory and inserts it into the database.
  The arguments are the same as `c:ExMachina.build/2`.
  """
  @callback insert(factory_name :: atom, attrs :: keyword | map) :: any

  @doc """
  Builds two factories and inserts them into the database.
  The arguments are the same as `c:ExMachina.build_pair/2`.
  """
  @callback insert_pair(factory_name :: atom, attrs :: keyword | map) :: list

  @doc """
  Builds many factories and inserts them into the database.
  The arguments are the same as `c:ExMachina.build_list/3`.
  """
  @callback insert_list(
              number_of_records :: integer,
              factory_name :: atom,
              attrs :: keyword | map
            ) :: list
end
