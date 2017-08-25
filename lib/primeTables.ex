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

  def matrix(list) when rem(length(list),2) == 0 do
    Enum.chunk(list,div(length(list), 2))
    |>  calculate_matrix(list)
  end

  def matrix([head | tail]) do
    #   IO.inspect tail, charlists: :as_lists
      [col1 | [col2]] = Enum.chunk(tail,2)
    #    IO.puts("col1")
    # IO.inspect col1, charlists: :as_lists

    #    IO.puts("col2")
    # IO.inspect col2, charlists: :as_lists
      case col2 do
        [] -> calculate_matrix([[head], col1], [head | tail])
        _ -> calculate_matrix([[head | col1], col2], [head | tail])
      end
  end

  defp calculate_matrix([col1, col2], row) do
    multiply = fn (e) ->  Stream.zip(row, Stream.cycle([e])) |> Enum.map(fn {x, y} -> x * y end) end
    
    res1 = col1
      |> Enum.map(&Task.async(fn -> multiply.(&1) end))
      |> Enum.map(&Task.await(&1))

   
    res2 = col2
      |> Enum.map(&Task.async(fn -> multiply.(&1) end))
      |> Enum.map(&Task.await(&1))

      # res1 ++ res2
  end

end

