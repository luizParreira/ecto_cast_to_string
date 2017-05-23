defmodule EctoCastToString.Float do
  @behaviour Ecto.Type
  def type, do: :string

  @moduledoc """
  This module casts an float into string, to be later saved by `Ecto`.
  """

  @doc """
  Casts the given input to the custom type.
  This callback is called on external input and can return any type,
  as long as the `dump/1` function is able to convert the returned
  value back into an Ecto native type. There are two situations where
  this callback is called:
    1. When casting values by `Ecto.Changeset`
    2. When passing arguments to `Ecto.Query`

  Returns the string representation of an integer.
  This is a variant of the example given by the Ecto Documentation:
  https://hexdocs.pm/ecto/Ecto.Type.html#module-example

  ## Examples

      iex> EctoCastToString.Float.cast(1.23)
      {:ok, "1.23"}

  ## Usage
      defmodule MyModel do
        schema "my_model" do
          field :a_string, EctoCastToString.Float

          timestamps()
        end
      end
  """
  @spec cast(float) :: {:ok, String.t} | :error
  def cast(float) when is_float(float), do: {:ok, Float.to_string(float)}

  # We should still accept strings
  def cast(string) when is_bitstring(string), do: {:ok, string}

  # Everything else is a failure though
  def cast(_), do: :error

  def load(string) when is_bitstring(string), do: {:ok, string}

  # When dumping data to the database, we *expect* an astring
  # but any value could be inserted into the struct, so we need
  # guard against them.
  def dump(string) when is_bitstring(string), do: {:ok, string}
  def dump(_), do: :error
end
