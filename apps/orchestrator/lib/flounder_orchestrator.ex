defmodule FlounderOrchestrator do
  @moduledoc """
  Documentation for FlounderOrchestrator.
  """

  def start_task(task, restart_policy) do
    Task.Supervisor.start_child(FlounderOrchestrator.Supervisor, task, restart: restart_policy)
  end

  def run_task(request, restart_policy \\ :temporary) do
    fn -> run(request) end
    |> start_task(restart_policy)
  end

  def run(request \\ %{}) do
    case request.type do
      :python ->
        %{:filename => filename, :method => method, :args => args} = request
        run_python(filename, method, args)
      :ruby ->
        %{:filename => filename, :method => method, :args => args} = request
        run_ruby(filename, method, args)
      :wasm ->
        %{:filename => filename, :method => method, :args => args} = request
        run_wasm(filename, method, args)
      :shell ->
        %{:script => script, :args => args} = request
        run_shell(script, args)
      _ -> {:error, "Unknown type: " <> request.type }
    end
  end

  def run_shell(script, args \\ []) do
     { result, 0 } = System.cmd(script, args)
     result
  end

  use Export.Ruby

  def run_ruby(filename, method, args \\ [], path \\ nil) do
    {:ok, ruby} = Ruby.start(ruby_lib: script_path(path))
    ruby |> Ruby.call(filename, method, args)
  end

  use Export.Python

  def run_python(filename, method, args \\ [], path \\ nil) do
    {:ok, py} = Python.start(python_path: script_path(path))
    py |> Python.call(filename, method, args)
  end

  defp script_path(path) do
    Path.expand(path || System.get_env("SCRIPTS") || (Path.dirname(__ENV__.file) <> "/scripts/"))
  end

  defp script_path(path, filename) do
    full_path = path || System.get_env("SCRIPTS") || (Path.dirname(__ENV__.file) <> "/scripts/")
    if(String.ends_with?(full_path, "/")) do full_path else full_path <> "/" end <> filename
  end

  use AlchemyVM

  def run_wasm(filename, method, args \\ [], path \\ nil) do
    {:ok, ref} = AlchemyVM.start()
    AlchemyVM.load_file(ref, script_path(path, filename))
    AlchemyVM.execute(ref, method, args)
  end
end
