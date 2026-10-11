defmodule MeuEnum do

  # Função pública: inicia a filtragem com um acumulador vazio.
  def filtrar(lista, predicado) do
    do_filtrar(lista, predicado, [])
  end

  # Caso base: quando a lista termina, inverte o acumulador.
  defp do_filtrar([], _predicado, acc) do
    inverter(acc, [])
  end

  # Caso recursivo: verifica cada elemento da lista.
  defp do_filtrar([head | tail], predicado, acc) do
    if predicado.(head) do
      # Se o predicado for verdadeiro, adiciona o elemento ao acumulador.
      do_filtrar(tail, predicado, [head | acc])
    else
      # Se for falso, continua sem adicionar o elemento.
      do_filtrar(tail, predicado, acc)
    end
  end

  # Caso base da inversão: retorna a lista na ordem correta.
  defp inverter([], acc) do
    acc
  end

  # Caso recursivo da inversão: move a cabeça para o acumulador.
  defp inverter([head | tail], acc) do
    inverter(tail, [head | acc])
  end

end
