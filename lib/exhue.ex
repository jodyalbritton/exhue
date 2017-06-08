defmodule Exhue do
  @moduledoc """
  Documentation for Exhue.
  """

  import List

  use HTTPoison.Base

  @url "/api"
  @headers [{"Content-type", "application/json"}]
  @body '{"devicetype":"my_hue_app#my_device"}'

  @doc """
  Registration
  """
  def register(ip) do

    {:ok, response} =
    Exhue.post("http://" <> ip <> @url, @body, @headers, [])

    if {:ok, response} do
      parsed =
      response.body
      |> Poison.Parser.parse!()

      first(parsed)
    end
  end

end
