defmodule Texto do

  # Recebe um texto e retorna as palavras únicas, filtradas e ordenadas.
  def palavras_unicas(texto) do
    texto
    |> String.downcase()
    |> String.replace(~r/[,\.!?]/, "")
    |> String.split()
    |> Enum.filter(fn palavra -> String.length(palavra) > 3 end)
    |> Enum.uniq()
    |> Enum.sort()
  end

end
