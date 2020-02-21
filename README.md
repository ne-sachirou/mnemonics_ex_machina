[![Actions Status](https://github.com/ne-sachirou/mnemonics_ex_machina/workflows/test/badge.svg)](https://github.com/ne-sachirou/mnemonics_ex_machina/actions)
[![Coverage Status](https://coveralls.io/repos/github/ne-sachirou/mnemonics_ex_machina/badge.svg)](https://coveralls.io/github/ne-sachirou/mnemonics_ex_machina)
[![Hex.pm](https://img.shields.io/hexpm/v/mnemonics_ex_machina.svg)](https://hex.pm/packages/mnemonics_ex_machina)

# Mnemonics.ExMachina

[ExMachina][exmachina] strategy for [Mnemonics][mnemonics].

## Usage

Just like `ExMachina.Ecto`. Instead of `use ExMachina` or `use ExMachina.Ecto`, we add `use Mnemonics.ExMachina`.

Currently we need an `id` column.

```elixir
defmodule Example do
  use Mnemonics, table_name: :examples

  defstruct id: "0"
end

defmodule ExampleFactory do
  use Mnemonics.ExMachina

  def example_factory, do: %Example{id: sequence("")}
end

defmodule ExampleTest do
  import ExampleFactory

  use ExUnit.Case

  test "insert" do
    example = insert(:example)
    assert [{example.id, example}] === :ets.lookup(Example.table_name(), example.id)
  end
end
```

[Document](https://hexdocs.pm/mnemonics_ex_machina).

## Installation

Add `:mnemonics_ex_machina` at `mix.exs` :

```elixir
def deps do
  [
    {:mnemonics_ex_machina, "~> 0.3"}
  ]
end
```

[exmachina]: https://hex.pm/packages/ex_machina
[mnemonics]: https://hex.pm/packages/mnemonics
