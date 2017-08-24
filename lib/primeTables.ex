defmodule PrimeTables do
  @moduledoc """
  PrimeTables keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def list_of_primes(n) do
    {:ok, pid} = MatrixServer.start_link
    result = remove_multiples(Enum.to_list(2..n), n, :math.sqrt(n), pid)
    IO.puts("NELSOON")
    IO.puts(inspect(length(result)))
    MatrixServer.get_matrix(pid)
    # remove_multiples(Enum.to_list(2..n), n, :math.sqrt(n), pid)
  end

  def remove_multiples([head | tail], n, l, pid) when head <= l do
    MatrixServer.calculate_table(pid, head)
    [head | remove_multiples(Enum.filter(tail, fn e -> rem(e, head) !== 0 end), n, l, pid)]
  end
  
  def remove_multiples([head | tail], _, l, pid) when head > l do
    MatrixServer.calculate_table(pid, head)
    Enum.each(tail, fn e -> MatrixServer.calculate_table(pid, e) end)
    # IO.puts(inspect(length(tail)))
    [head | tail]
  end

  def remove_multiples([], _, _, _) do
    []
  end

end

