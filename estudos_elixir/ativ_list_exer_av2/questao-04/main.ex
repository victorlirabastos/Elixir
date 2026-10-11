defmodule Contador do

  # Função pública: inicia a contagem com um mapa vazio.
  def frequencia(lista) do
    do_frequencia(lista, %{})
  end

  # Caso base: quando a lista termina, retorna o mapa acumulado.
  defp do_frequencia([], acc) do
    acc
  end

  # Caso recursivo: contabiliza o elemento e processa o restante.
  defp do_frequencia([head | tail], acc) do
    novo_acc = Map.update(acc, head, 1, fn valor -> valor + 1 end)

    do_frequencia(tail, novo_acc)
  end

end
