defmodule PrimeTablesWeb.PageView do
  use PrimeTablesWeb, :view

   def get_prime_number_from_list(numbers, list) do
  	Enum.at(numbers, elem(list,1))
  end

end
