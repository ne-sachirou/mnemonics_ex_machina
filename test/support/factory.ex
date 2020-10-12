defmodule Mnemonics.ExMachina.Factory do
  @moduledoc false

  alias Mnemonics.ExMachina.Example

  use Mnemonics.ExMachina

  def example_factory do
    %Example{
      id: String.to_integer(sequence("")),
      name: sequence("example")
    }
  end
end
