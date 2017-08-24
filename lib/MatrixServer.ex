defmodule MatrixServer do
  use GenServer

  @timeout 100000000

  ## Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def calculate_table(pid, number) do
      GenServer.cast(pid, {:number, number})
  end

  def get_matrix(pid) do
      GenServer.call(pid, :get_matrix, @timeout)
  end

  ## Callbacks
  
  def handle_call(:get_matrix, _from, matrix) do
      {:reply, matrix, matrix,  @timeout}
  end

  def handle_cast({:number, number}, matrix) do
      new_matrix = 
        matrix
        |> Enum.reduce(matrix, fn({k,_v}, acc) -> put_in(acc[k][number], k * number) end)
        |> Map.put(number, %{})

        new_matrix = Enum.reduce(new_matrix, new_matrix, fn({k,_v}, acc) -> put_in(acc[number][k], k * number) end)
      {:noreply, new_matrix}
  end

  def init(:ok) do
      {:ok, %{2 => %{}}, @timeout}
  end


end
