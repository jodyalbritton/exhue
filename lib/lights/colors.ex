defmodule Exhue.Colors do
  @moduledoc """
  Color conversion utilities
  """

  @doc """
  Convert XY color values to RGB
  """
  def xy_to_color(x,y, bri) do
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


    final_r = if (new_r * 255) < 0, do: 255, else: new_r * 255
    final_g = if (new_g * 255) < 0, do: 255, else: new_g * 255
    final_b = if (new_b * 255) < 0, do: 255, else: new_b * 255

    output_r = if (final_r < 0), do: 255, else: final_r
    output_g = if (final_g < 0), do: 255, else: final_g
    output_b = if (final_b < 0), do: 255, else: final_b

    %{r: round(output_r), g: round(output_g), b: round(output_b)}
  end
end
