defmodule Logistica do

  # Rejeita pesos não numéricos ou menores/iguais a zero.
  def calcular_frete(peso, _rota)
      when not is_number(peso) or peso <= 0 do
    {:error, "Peso deve ser maior que zero"}
  end

  # Região Nordeste - Envio padrão.
  def calcular_frete(peso, {:nordeste, :padrao}) do
    {:ok, 15.0 + peso * 2.5}
  end

  # Região Nordeste - Envio expresso.
  def calcular_frete(peso, {:nordeste, :expresso}) do
    {:ok, 30.0 + peso * 4.0}
  end

  # Região Sul - Envio padrão.
  def calcular_frete(peso, {:sul, :padrao}) do
    {:ok, 20.0 + peso * 3.0}
  end

  # Região Sul - Envio expresso.
  def calcular_frete(peso, {:sul, :expresso}) do
    {:ok, 38.0 + peso * 5.0}
  end

  # Fallback: região ou modalidade não cadastrada.
  def calcular_frete(_peso, _rota) do
    {:error, :rota_indisponivel}
  end

end
