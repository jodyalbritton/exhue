defmodule Exhue.Schedules do
  @moduledoc """
  Groups module
  """


  @url "/api"

  @doc """
  list groups
  """
  def list(ip, token) do
    {:ok, response} =
    Exhue.get("http://" <> ip <> @url <> "/" <> token <> "/schedules")

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end
end
