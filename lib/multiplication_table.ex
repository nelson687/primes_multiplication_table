defmodule MultiplicationTable do

    def matrix(list) do
    multiply = fn (e) ->  Stream.zip(list, Stream.cycle([e])) |> Enum.map(fn {x, y} -> x * y end) end

    list
      |> Enum.map(&Task.async(fn -> multiply.(&1) end))
      |> Enum.map(&Task.await(&1))

  end

end