defmodule EctoCastToString.IntegerTest do
  use ExUnit.Case
  doctest EctoCastToString.Integer

  describe "cast/1" do
    test "an integer" do
      assert {:ok, "1"} == EctoCastToString.Integer.cast(1)
    end

    test "a string" do
      assert {:ok, "500"} == EctoCastToString.Integer.cast("500")
    end

    test "a float" do
      assert :error == EctoCastToString.Integer.cast(1.234)
    end
  end

  describe "load/1" do
    test "a string" do
      assert {:ok, "500"} == EctoCastToString.Integer.load("500")
    end
  end

  describe "dump/1" do
    test "an integer" do
      assert :error == EctoCastToString.Integer.dump(1)
    end

    test "a string" do
      assert {:ok, "900"} == EctoCastToString.Integer.dump("900")
    end

    test "a float" do
      assert :error == EctoCastToString.Integer.dump(1.234)
    end
  end
end
