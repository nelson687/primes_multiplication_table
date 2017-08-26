defmodule PrimeTablesWeb.PageControllerTest do
  use PrimeTablesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Primes multiplication table"
  end

  test "GET /matrix with valid input", %{conn: conn} do
    conn = get conn, page_path(conn, :get_matrix, %{number: "1"})

    assert html_response(conn, 200) =~ "Multiplication Table"
  end

  test "GET /matrix with invalid input", %{conn: conn} do
    conn = get conn, page_path(conn, :get_matrix, %{number: "a"})
    assert redirected_to(conn) == page_path(conn, :index)
  end
end
