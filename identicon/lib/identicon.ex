defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def hash_input(input) do
    %Identicon.Image{
      hex: :crypto.hash(:md5, input)
           |> :binary.bin_to_list
    }
  end

  def pick_color(%Identicon.Image{hex: [red, green, blue | _tail]} = image) do
    %Identicon.Image{image | color: {red, green, blue}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk
  end

  def mirror_row(row) do
    [first, second | _tail] = row

    row ++ [second, first]
  end
end
