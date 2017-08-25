defmodule PrimeTables do
  @moduledoc """
  PrimeTables keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def list_of_primes(n) do
    {:ok, pid} = MatrixServer.start_link
    remove_multiples(Enum.to_list(2..n), n, :math.sqrt(n), pid)
  end

  def remove_multiples([head | tail], n, l, pid) when head <= l do
    [head | remove_multiples(Enum.filter(tail, fn e -> rem(e, head) !== 0 end), n, l, pid)]
  end
  
  def remove_multiples([head | tail], _, l, _) when head > l do
    [head | tail]
  end

  def remove_multiples([], _, _, _) do
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

end

