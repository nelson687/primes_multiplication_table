defmodule PrimeTablesWeb.PageController do
  use PrimeTablesWeb, :controller

  def index(conn, _params) do
    conn
    |> put_layout(false)
    |> render("index.html")
  end

  def get_matrix(conn, %{"number" => number}) do
    case Integer.parse(number) do
      {limit, _} when limit > 0 -> 
          {multiplication_table, primes_list} = PrimeTables.get_multiplication_table(limit)
          conn
          |> put_layout(false)
          |> render("matrix.html", matrix: Enum.with_index(multiplication_table), numbers: primes_list)
      _ ->
         conn
		   		|> put_flash(:error, "Must insert an integer greater or equal than 1")
          |> redirect(to: page_path(conn, :index))
    end
  end

end
