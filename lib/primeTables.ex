defmodule PrimeTables do
  @moduledoc """
  PrimeTables keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def list_of_primes(n) do
    primes = remove_multiples(Enum.to_list(2..n), n, :math.sqrt(n))
    primes
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

end

