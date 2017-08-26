defmodule MultiplicationTableTest do
 use ExUnit.Case


  test "Calculates matrix" do
    primes_list = [2, 3, 5]
    expected_result = [[4, 6, 10], [6, 9, 15], [10, 15, 25]]
    result = MultiplicationTable.matrix(primes_list)
    
    assert result == expected_result
  end
end
