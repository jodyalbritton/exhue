defmodule Exhue do
  @moduledoc """
  Documentation for Exhue.
  """

  import List
  use HTTPoison.Base

  @url "/api"
  @headers [{"Content-type", "application/json"}]
  @body '{"devicetype":"my_hue_app#my_device"}'

  defmodule Bridge do
    @moduledoc """
    Structure holding the state of the connection with the bridge device

    * `host`     - IP address or hostname of the bridge device
    * `username` - Token
    * `status`   - `:ok` or `:error`
    * `error`    - error message
    """

    defstruct host: nil, username: nil, status: :ok, error: nil
  end


  @doc """
  Creates a connection with the bridge available on the given host or IP address.
  Username can be obtained using `authorize/2`.
  """
  def connect(host, username \\ nil) do
    %Bridge{host: host, username: username}
  end

  @doc """
  Authroize
  """
  def authorize(bridge) do
    {:ok, response} =
    Exhue.post("http://" <> bridge.host <> @url, @body, @headers, [])

    if {:ok, response} do
      parsed =
      response.body
      |> Poison.Parser.parse!()

      first(parsed)
    end
  end

end
