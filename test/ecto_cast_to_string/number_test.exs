defmodule EctoCastToString.NumberTest do
  use ExUnit.Case
  doctest EctoCastToString.Number

  describe "cast/1" do
    test "an number" do
      assert {:ok, "1"} == EctoCastToString.Number.cast(1)
    end

    test "a string" do
      assert {:ok, "500"} == EctoCastToString.Number.cast("500")
    end

    test "a float" do
      assert {:ok, "1.234"} == EctoCastToString.Number.cast(1.234)
    end

    test "an atom" do
      assert :error == EctoCastToString.Number.cast(:atom)
    end
  end

  describe "load/1" do
    test "a string" do
      assert {:ok, "500"} == EctoCastToString.Number.load("500")
    end
  end

  describe "dump/1" do
    test "an integer" do
      assert {:ok, "1"} == EctoCastToString.Number.dump(1)
    end

    test "a string" do
      assert {:ok, "900"} == EctoCastToString.Number.dump("900")
    end

    test "a float" do
      assert {:ok, "1.234"} == EctoCastToString.Number.dump(1.234)
    end

    test "an atom" do
      assert :error == EctoCastToString.Number.cast(:atom)
    end
  end
end
