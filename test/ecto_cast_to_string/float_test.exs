defmodule EctoCastToString.FloatTest do
  use ExUnit.Case
  doctest EctoCastToString.Float

  describe "cast/1" do
    test "an integer" do
      assert :error == EctoCastToString.Float.cast(1)
    end

    test "a string" do
      assert {:ok, "1.34"} == EctoCastToString.Float.cast("1.34")
    end

    test "a float" do
      assert {:ok, "1.234"} == EctoCastToString.Float.cast(1.234)
    end
  end

  describe "load/1" do
    test "a string" do
      assert {:ok, "1.23"} == EctoCastToString.Float.load("1.23")
    end
  end

  describe "dump/1" do
    test "an integer" do
      assert :error == EctoCastToString.Float.dump(1)
    end

    test "a string" do
      assert {:ok, "1.23"} == EctoCastToString.Float.dump("1.23")
    end

    test "a float" do
      assert :error == EctoCastToString.Float.dump(1.234)
    end
  end
end
