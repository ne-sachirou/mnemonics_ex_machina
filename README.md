Mnemonics.ExMachina
==
[ExMachina][ExMachina] strategy for [Mnemonics][Mnemonics].

[![Hex.pm](https://img.shields.io/hexpm/v/mnemonics_ex_machina.svg)](https://hex.pm/packages/mnemonics_ex_machina)
[![Build Status](https://travis-ci.org/ne-sachirou/mnemonics_ex_machina.svg?branch=master)](https://travis-ci.org/ne-sachirou/mnemonics_ex_machina)

Usage
--
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

Installation
--
Add `:mnemonics_ex_machina` at `mix.exs` :

```elixir
def deps do
  [
    {:mnemonics_ex_machina, "~> 0.2"}
  ]
end
```

[ExMachina]: https://hex.pm/packages/ex_machina
[Mnemonics]: https://hex.pm/packages/mnemonics
