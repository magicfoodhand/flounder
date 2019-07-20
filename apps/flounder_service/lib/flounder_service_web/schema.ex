defmodule FlounderServiceWeb.Schema do
  @moduledoc false
  use Absinthe.Schema

  alias FlounderServiceWeb.MutationResolver
  alias FlounderServiceWeb.QueryResolver

  query do
    field :meaning_of_life, non_null(:string), do: resolve &QueryResolver.meaning_of_life/3
  end
end
