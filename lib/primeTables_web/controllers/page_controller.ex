defmodule PrimeTablesWeb.PageController do
  use PrimeTablesWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout(false)
    |> render "index.html"
  end

  def get_matrix(conn, %{"number" => number}) do
    {limit, _}  = Integer.parse(number)
    {multiplication_table, primes_list} = PrimeTables.get_multiplication_table(limit)

    conn
    |> put_layout(false)
    |> render "matrix.html", matrix: Enum.with_index(multiplication_table), numbers: primes_list
  end

end
