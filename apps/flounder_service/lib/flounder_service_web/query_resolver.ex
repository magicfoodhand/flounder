defmodule FlounderServiceWeb.QueryResolver do
  @moduledoc false
  def meaning_of_life(_root, _args, _info) do
    {:ok, "42"}
  end
end
