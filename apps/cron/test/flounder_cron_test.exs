defmodule FlounderCronTest do
  use ExUnit.Case
  doctest FlounderCron

  test "greets the world" do
    assert FlounderCron.hello() == :world
  end
end
