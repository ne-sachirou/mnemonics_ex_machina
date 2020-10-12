alias Mnemonics.ExMachina.Example

File.mkdir_p!("/tmp/mnemonics_ex_machina")
{:ok, _} = Mnemonics.start_link(ets_dir: "/tmp/mnemonics_ex_machina")
Example.create_ets()
Example.load(1)
ExUnit.start()
