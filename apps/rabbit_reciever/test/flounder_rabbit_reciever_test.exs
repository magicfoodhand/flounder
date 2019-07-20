defmodule FlounderRabbitRecieverTest do
  use ExUnit.Case
  doctest FlounderRabbitReciever

  test "greets the world" do
    assert FlounderRabbitReciever.hello() == :world
  end
end
