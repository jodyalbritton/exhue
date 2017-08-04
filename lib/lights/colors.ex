defmodule Exhue.Colors do
  @moduledoc """
  Color conversion utilities
  """

  @doc """
  Convert XY color values to RGB
  """
  def xy_to_color(x,y, bri) do
    z = 1.0 - x - y

    Y = bri

    X = (Y / y) * x
    Z = (Y / y) * z

    r =  (X * 1.612) - (Y * 0.203) - (Z * 0.302)
    g = -(X * 0.509) + (Y * 1.412) + (Z * 0.066)
    b =  (X * 0.026) - (Y * 0.072) + (Z * 0.962)

    IO.inspect r
    IO.inspect g
    IO.inspect b
  end
end
