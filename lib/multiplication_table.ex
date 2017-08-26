defmodule MultiplicationTable do

    def matrix(list) do
    row = list
    col = row

    multiply = fn (e) ->  Stream.zip(row, Stream.cycle([e])) |> Enum.map(fn {x, y} -> x * y end) end

    col
      |> Enum.map(&Task.async(fn -> multiply.(&1) end))
      |> Enum.map(&Task.await(&1))

  end

end