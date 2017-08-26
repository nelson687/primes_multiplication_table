defmodule PrimeTablesTest do
 use ExUnit.Case

  test "Returns list of primes + 1 for input == 1" do
    expected_list = [2]
    list_of_primes_plus = PrimeTables.get_list_of_primes(1)
    assert list_of_primes_plus == expected_list
  end

  test "Returns list of primes + 1 for input == 10" do
    expected_list = [2, 3, 5, 7, 11]
    list_of_primes_plus = PrimeTables.get_list_of_primes(10)
    assert list_of_primes_plus == expected_list
  end

  test "Returns multiplication table of primes + 1 for input == 3" do
    expected_result = [[4, 6, 10], [6, 9, 15], [10, 15, 25]]
    {matrix, _} = PrimeTables.get_multiplication_table(3)
    assert matrix == expected_result
  end
end
