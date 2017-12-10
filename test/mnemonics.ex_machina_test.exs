defmodule Mnemonics.ExMachinaTest do
  import Mnemonics.ExMachina.Factory

  use ExUnit.Case, async: true

  doctest Mnemonics.ExMachina

  describe "ExMachina" do
    test "build", do: assert %Example{} = build :example

    test "build_list" do
      assert [
        %Example{},
        %Example{},
        %Example{},
      ] = build_list 3, :example
    end

    test "build_pair" do
      assert [
        %Example{},
        %Example{},
      ] = build_pair :example
    end
  end

  describe "insert" do
    test "insert" do
      example = insert :example
      assert [{example.id, example}] == :ets.lookup Example.table_name, example.id
    end

    test "insert with params" do
      example = insert :example, name: "509599d8-f446-4c20-b49e-50849546fb44"
      assert [{example.id, example}] == :ets.lookup Example.table_name, example.id
      assert "509599d8-f446-4c20-b49e-50849546fb44" == example.name
    end

    test "insert_list" do
      count1 = :ets.select_count Example.table_name, [{:_, [], [true]}]
      insert_list 3, :example
      count2 = :ets.select_count Example.table_name, [{:_, [], [true]}]
      assert 3 == count2 - count1
    end


    test "insert_pair" do
      count1 = :ets.select_count Example.table_name, [{:_, [], [true]}]
      insert_pair :example
      count2 = :ets.select_count Example.table_name, [{:_, [], [true]}]
      assert 2 == count2 - count1
    end
  end
end
