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

  def put_new_entry(pid, number) do
      GenServer.cast(pid, {:put_new_entry, number})
  end

  def get_matrix(pid) do
      GenServer.call(pid, :get_matrix, @timeout)
  end

  ## Callbacks
  
  def handle_call(:get_matrix, _from, matrix) do
      {:reply, matrix, matrix,  @timeout}
  end

  def handle_cast({:number, number}, matrix) do
    #  IO.puts(inspect(number))
      # new_matrix = Map.put(matrix, number, %{})
      
      new_matrix_1 = Enum.reduce(matrix, matrix, fn({k,_v}, acc) -> put_in(acc[k][number], k * number) end)
      # new_matrix_1 = Enum.reduce(matrix, matrix, fn({k,_v}, acc) -> put_in(acc[k][number], k * number) end)
      # new_matrix = Enum.into(matrix, %{number => %{}})

      # ne = Map.merge(new_matrix_1, new_matrix, fn _, a, b -> Map.merge(a, b) end)
        # IO.puts(inspect(new_matrix_1))

      # new_matrix2 = Enum.reduce(new_matrix_1, new_matrix_1, fn({k,_v}, acc) -> put_in(acc[number][k], k * number) end)
      # IO.puts(inspect(new_matrix2))
      {:noreply, new_matrix_1}
  end

  def handle_cast({:put_new_entry, number}, matrix) do
    #  IO.puts(inspect(number))
      new_matrix = Map.put(matrix, number, %{})
      # new_matrix_1 = Enum.reduce(new_matrix, new_matrix, fn({k,_v}, acc) -> put_in(acc[k][number], k * number) end)
      # new_matrix_1 = Enum.reduce(matrix, matrix, fn({k,_v}, acc) -> put_in(acc[k][number], k * number) end)
      # new_matrix = Enum.into(matrix, %{number => %{}})

      # ne = Map.merge(new_matrix_1, new_matrix, fn _, a, b -> Map.merge(a, b) end)
        # IO.puts(inspect(length(new_matrix)))
    #   new_matrix2 = Enum.reduce(new_matrix1, new_matrix1, fn({k,_v}, acc) -> put_in(acc[number][k], k * number) end)
    #  IO.puts("incomplete matrix")  
    # IO.puts(inspect(new_matrix))
      {:noreply, new_matrix}
  end

  def init(:ok) do
      {:ok, %{2 => %{}}, @timeout}
  end


end
