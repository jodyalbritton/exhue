defmodule Exhue.Lights do
  @moduledoc """
  Lights module
  """

  @url "/api"

  @doc """
  list lights
  """
  def list(ip, token) do
    {:ok, response} =
    Exhue.get("http://" <> ip <> @url <> "/" <> token <> "/lights")

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end

  @doc """
  Show a single light
  """
  def show(ip, token, id) do
    {:ok, response} =
    Exhue.get("http://" <> ip <> @url <> "/" <> token <> "/lights/#{id}")

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end

  @doc """
  Turn on a single light
  """
  def turn_on(ip, token, id, level, transition \\ 4) do
    headers = [{"Content-type", "application/json"}]

    body = '{"on":true, "bri":#{level}, "transitiontime":#{transition}}'

    {:ok, response} =
    Exhue.put("http://" <> ip <> @url <> "/" <> token <> "/lights/#{id}/state", body, headers, [])

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end

  @doc """
  turn off a single light
  """
  def turn_off(ip, token, id, transition \\ 4) do
    headers = [{"Content-type", "application/json"}]

    body = '{"on":false, "transitiontime":#{transition}}'

    {:ok, response} =
    Exhue.put("http://" <> ip <> @url <> "/" <> token <> "/lights/#{id}/state", body, headers, [])

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end

  @doc """
  set the brightness level of a single light
  """
  def set_level(ip, token, id, level, transition \\ 4) do
    headers = [{"Content-type", "application/json"}]

    body = '{"on":true, "bri":#{level}, "transitiontime":#{transition}}'

    {:ok, response} =
    Exhue.put("http://" <> ip <> @url <> "/" <> token <> "/lights/#{id}/state", body, headers, [])

    if {:ok, response} do
      response.body
      |> Poison.Parser.parse!()
    end
  end
end
