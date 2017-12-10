File.mkdir_p! "/tmp/mnemonics_ex_machina"
Application.put_env :mnemonics, :ets_dir, "/tmp/mnemonics_ex_machina"
Example.create_ets
Example.load 1
ExUnit.start
