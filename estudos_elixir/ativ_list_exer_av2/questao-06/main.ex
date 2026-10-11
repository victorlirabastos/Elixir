defmodule RelatorioVendas do

  # Recebe uma lista de pedidos e gera o relatório de vendas pagas.
  def gerar(pedidos) do

    # Filtra apenas os pedidos com status :pago.
    pedidos_pagos =
      pedidos
      |> Enum.filter(fn pedido -> pedido.status == :pago end)

    # Conta a quantidade de pedidos pagos.
    total_pedidos = Enum.count(pedidos_pagos)

    # Evita divisão por zero quando não existem pedidos pagos.
    if total_pedidos == 0 do
      {:ok, 0, 0.0}
    else

      # Soma os valores dos pedidos pagos.
      valor_total =
        pedidos_pagos
        |> Enum.map(fn pedido -> pedido.valor end)
        |> Enum.sum()

      # Calcula e arredonda o ticket médio para duas casas decimais.
      ticket_medio =
        valor_total
        |> Kernel./(total_pedidos)
        |> Float.round(2)

      # Retorna o relatório no formato solicitado.
      {:ok, total_pedidos, ticket_medio}
    end
  end

end
