defmodule Fibonacci do
  @moduledoc """
  A module to provide access to the infinite Fibonacci Sequence.
  """

  @doc """
  Generate the Fibonacci sequence

  Streams in Elixir are infinite, so we can generate as many fibonacci numbers
  as we like, and then use other funtions to take only what we need.
  """
  def fibonacci do
    Stream.unfold( 0, fn fibs ->
      next = next_fib(fibs)
      { elem(next, 1), next }
    end )
  end

  @doc """
  Take the first n values of the Fibonacci Sequence

  `Enum.take/2` coerces the first `n` elements of the Stream into a List.
  It doesn't require evaluating the whole Stream, which allows us to
  arbitrarily decide how many values we want without performance impacts.

  If the input is invalid, return an empty list.

  ## Examples

      iex> Fibonacci.take(5)
      [0, 1, 1, 2, 3]

      iex> Fibonacci.take(7)
      [0, 1, 1, 2, 3, 5, 8]

      iex> Fibonacci.take("hello")
      []

  """
  def take(n) when is_integer(n), do: fibonacci() |> Enum.take(n)
  def take(_), do: []

  @doc """
  Get the element at index n of the Fibonacci sequence

  We use Stream.drop to lazily get rid of the first `n` elements, and
  then we use `Enum.at/2` to coerce the first element into a real value.
  Since we lazily drop the first `n` values, we save memory by not keeping
  them around in a list. As such, the `get/1` function can produce larger
  values than the `take/1` function.

  If the input is invalid, return 0.

  ## Examples

      iex> Fibonacci.get(5)
      5

      iex> Fibonacci.get(7)
      13

      iex> Fibonacci.get("hello")
      0

  """
  def get(n) when is_integer(n), do: fibonacci() |> Stream.drop(n) |> Enum.at(0)
  def get(_), do: 0

  # Get the next element of the fibonacci sequence
  # If the current element is 0, return {1, 0}
  defp next_fib(0), do: {1, 0}
  # If the current element is a tuple of two numbers,
  # Sum them for the first element and keep the previous
  # largest number as the second element
  defp next_fib({x, y}), do: {x + y, x}
end
