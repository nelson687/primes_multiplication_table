defmodule PrimeCalculatorTest do
 use ExUnit.Case

  test "Returns list of primes for input == 2" do
    expected_list = [2]
    list_of_primes = PrimeCalculator.get_primes(2)
    assert list_of_primes == expected_list
  end

  test "Returns list of primes for input == 4" do
    expected_list = [2, 3]
    list_of_primes = PrimeCalculator.get_primes(4)
    assert list_of_primes == expected_list
  end

  test "Returns list of primes for input == 5" do
    expected_list = [2, 3, 5]
    list_of_primes = PrimeCalculator.get_primes(5)
    assert list_of_primes == expected_list
  end

  test "Returns list of primes + 1 for input == 5" do
    prime_list = [2, 3, 5]
    expected_list = [2, 3, 5, 7]
    list_of_primes_plus = PrimeCalculator.find_next_prime(5, prime_list)
    assert list_of_primes_plus == expected_list
  end

  # test "Returns list without multiples" do
  #   expected_list = [2, 3, 5, 7]
  #   list_without_multiples = PrimeTables.list_of_primes(100000)
  #   IO.inspect(list_without_multiples)
  #   assert list_without_multiples == expected_list
  # end

  # test "Calculates matrix" do
  #   list_of_primes = PrimeTables.calculate_multiplication_table(3)
  #   # list_of_primes = PrimeTables.list_of_primes(5)
  #   # IO.puts("NELSON")
  #   # IO.inspect(list_of_primes)
  #   # res = MultiplicationTable.matrix(list_of_primes)
  #   # IO.puts("matrix")
  #   # IO.inspect(res)
  #   assert true
  # end
end
