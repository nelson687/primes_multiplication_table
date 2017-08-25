defmodule PrimeTables do
  @moduledoc """
  PrimeTables keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def list_of_primes(n) do
    prime_list = remove_multiples(Enum.to_list(2..n), n, :math.sqrt(n))
    find_next_prime(n, length(prime_list), length(prime_list), [])
  end

  def remove_multiples([head | tail], n, l) when head <= l do
    [head | remove_multiples(Enum.filter(tail, fn e -> rem(e, head) !== 0 end), n, l)]
  end
  
  def remove_multiples([head | tail], _, l) when head > l do
    [head | tail]
  end

  def remove_multiples([], _, _) do
    []
  end

  def matrix(list) do
    row = list
    col = row

    multiply = fn (e) ->  Stream.zip(row, Stream.cycle([e])) |> Enum.map(fn {x, y} -> x * y end) end


    col
      |> Enum.map(&Task.async(fn -> multiply.(&1) end))
      |> Enum.map(&Task.await(&1))

      #sequentially
      # Enum.map(col, fn (e) ->  Stream.zip(row, Stream.cycle([e])) |> Enum.map(fn {x, y} -> x * y end) end)
  end

  def find_next_prime(n, length, new_length, _) when new_length <= length do
    new_list = remove_multiples(Enum.to_list(2..n+2), n+2, :math.sqrt(n+2))
    find_next_prime(n+2, length, length(new_list), new_list)
  end

  def find_next_prime(_, _, _, new_list) do
    new_list
  end

end

