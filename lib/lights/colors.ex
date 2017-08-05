defmodule Exhue.Colors do
  @moduledoc """
  Color conversion utilities
  """

  @doc """
  Convert XY color values to RGB
  """
  def xy_to_color(xy, bri) do
    [x,y] = xy


    z = 1.0 - x - y

    yval = bri

    xval = (yval / y) * x
    zval = (yval / y) * z

    r =  (xval * 1.656492) - (yval * 0.354851) - (zval * 0.255038)
    g =  (-xval * 0.707196) + (yval * 1.655397) + (zval * 0.036152)
    b =  (xval * 0.051713) - (yval *  0.121364) + (zval * 1.011530)

    rval = if (r <= 0.0031308), do: 12.92 * r, else: (1.0 + 0.055) * :math.pow(r, (1.0 / 2.4)) - 0.055

    gval = if (g <= 0.0031308), do: 12.92 * g, else: (1.0 + 0.055) * :math.pow(g, (1.0 / 2.4)) - 0.055

    bval = if (b <= 0.0031308), do: 12.92 * b, else: (1.0 + 0.055) * :math.pow(b, (1.0 / 2.4)) - 0.055


    maxvalue =  Enum.max([rval, gval, bval])

    new_r = rval / maxvalue
    new_g = gval / maxvalue
    new_b = bval / maxvalue


    final_r = if (new_r * 255) < 0, do: 0, else: new_r * 255
    final_g = if (new_g * 255) < 0, do: 0, else: new_g * 255
    final_b = if (new_b * 255) < 0, do: 0, else: new_b * 255



    %{r: round(final_r), g: round(final_g), b: round(final_b)}
  end

  def color_to_xy(rgb) do
    [r,g,b] = rgb

    red =
    if (r > 0.04045), do: :math.pow((r + 0.055 / 1.055), 2.4 ), else:  r / 12.92

    green =
    if (g > 0.04045), do: :math.pow((g + 0.055 / 1.055), 2.4 ), else:  g / 12.92

    blue =
    if (b > 0.04045), do: :math.pow((b + 0.055 / 1.055), 2.4 ), else:  b / 12.92

    x =  red * 0.664511 + green * 0.154324 + blue * 0.162028
    y = red * 0.283881 + green * 0.668433 + blue * 0.047685
    z = red * 0.000088 + green * 0.072310 + blue * 0.986039

    if (x+y+z == 0), do: [x,y], else: [x/(x+y+z), y/(x+y+z)]
  end
end
