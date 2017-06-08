defmodule Exhue.Rules do
  @moduledoc """
  Groups module
  """


  @url "/api"

  @doc """
  list groups
  """
  def list(ip, token) do
    {:ok, response} =
    Exhue.get("http://" <> ip <> @url <> "/" <> token <> "/rules")

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end
end
