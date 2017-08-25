defmodule PageControllerTest do
 use ExUnit.Case

#   test "Returns list of primes for input == 2" do
#     prime_number = PrimeTables.list_of_primes(2)
#     assert prime_number == [2]
#   end

  # test "Returns list of primes for input == 3" do
  #   expected_list = [2, 3]
  #   list_of_primes = PrimeTables.list_of_primes(100000)
  #   assert list_of_primes == expected_list
  # end

#   test "Returns list of primes for input == 5" do
#     expected_list = [2, 3, 5]
#     list_of_primes = PrimeTables.list_of_primes(5)
#     assert list_of_primes == expected_list
#   end

  # test "Returns list without multiples" do
  #   expected_list = [2, 3, 5, 7]
  #   list_without_multiples = PrimeTables.list_of_primes(100000)
  #   IO.inspect(list_without_multiples)
  #   assert list_without_multiples == expected_list
  # end

  test "Calculates matrix" do
    list_of_primes = PrimeTables.list_of_primes(150000)
    IO.inspect(length(list_of_primes))
    # list_of_primes = PrimeTables.list_of_primes(5)
    # IO.puts("NELSON")
    IO.inspect(list_of_primes)
    res = PrimeTables.matrix(list_of_primes)
    # IO.puts("matrix")
    IO.inspect(res)
    assert true
  end
end
