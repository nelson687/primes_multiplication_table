defmodule PrimeTablesWeb.PageControllerTest do
  use PrimeTablesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Prime table"
  end
end
