defmodule PrimeTables do
  @moduledoc """
  PrimeTables keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_list_of_primes(1) do
    PrimeCalculator.get_primes(2)
  end

  def get_list_of_primes(n) do
    prime_list = PrimeCalculator.get_primes(n)
    PrimeCalculator.find_next_prime(n, prime_list)
  end

  def get_multiplication_table(n) do
    primes_list = get_list_of_primes(n)
    multiplication_table = MultiplicationTable.matrix(primes_list)
    {multiplication_table, primes_list}
  end

end

