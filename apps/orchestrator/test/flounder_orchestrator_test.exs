
defmodule FlounderOrchestratorTest do
  use ExUnit.Case
  doctest FlounderOrchestrator
  @base Path.dirname(__ENV__.file) <> "/scripts/"

  test "runs shell scripts directly" do
    assert FlounderOrchestrator.run_shell("echo", ["hello"]) == "hello\n"
  end

  test "run ruby scripts directly" do
    assert FlounderOrchestrator.run_ruby("hello", "hello", [], @base) == "hello"
  end

  test "runs python scripts directly" do
    assert FlounderOrchestrator.run_python("hello", "hello", [], @base) == "hello"
  end

  test "runs shell scripts" do
    assert FlounderOrchestrator.run(%{type: :shell, script: "echo", args: ["42"]}) == "42\n"
  end

  test "runs ruby scripts" do
    assert FlounderOrchestrator.run(%{type: :ruby, filename: "hello", method: "meaning_of_life", args: []}) == 42
  end

  test "runs python scripts" do
    assert FlounderOrchestrator.run(%{type: :python, filename: "hello", method: "meaning_of_life", args: []}) == 42
  end

  test "runs ruby scripts - use path from ENV" do
    System.put_env("SCRIPTS", Path.dirname(__ENV__.file) <> "/scripts/env")
    assert FlounderOrchestrator.run(%{type: :ruby, filename: "hello", method: "meaning_of_life", args: []}) == 24
    System.delete_env("SCRIPTS")
  end

  test "runs python scripts - use path from ENV" do
    System.put_env("SCRIPTS", Path.dirname(__ENV__.file) <> "/scripts/env")
    assert FlounderOrchestrator.run(%{type: :python, filename: "hello", method: "meaning_of_life", args: []}) == 24
    System.delete_env("SCRIPTS")
  end
end
