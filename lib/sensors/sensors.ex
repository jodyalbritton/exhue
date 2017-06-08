defmodule Exhue.Sensors do
  @moduledoc """
  Groups module
  """


  @url "/api"

  @doc """
  list groups
  """
  def list(ip, token) do
    {:ok, response} =
    Exhue.get("http://" <> ip <> @url <> "/" <> token <> "/sensors")

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end
end
