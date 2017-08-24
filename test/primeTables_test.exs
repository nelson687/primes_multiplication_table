defmodule PageControllerTest do
 use ExUnit.Case

  test "Returns list of primes for input == 2" do
    prime_number = PrimeTables.list_of_primes(2)
    assert prime_number == [2]
  end

  test "Returns list of primes for input == 3" do
    expected_list = [2, 3]
    list_of_primes = PrimeTables.list_of_primes(3)
    assert list_of_primes == expected_list
  end

  test "Returns list without multiples" do
    expected_list = [2, 3, 5, 7]
    list_without_multiples = PrimeTables.list_of_primes(10)
    assert list_without_multiples == expected_list
  end
end
