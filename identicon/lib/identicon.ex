defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def hash_input(input) do
    %Identicon.Image{
      hex: :crypto.hash(:md5, input)
           |> :binary.bin_to_list
    }
  end

  def pick_color(image) do
    %Identicon.Image{hex: [red, green, blue | _tail]} = image

    [red, green, blue]
  end
end
