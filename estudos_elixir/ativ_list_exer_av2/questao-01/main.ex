defmodule Conversor do

  # Rejeita valores negativos ou que não sejam numéricos
  def converter(valor, _modedas) when not is_number(valor) or valor < 0 do
    {:error, "Valor deve ser positivo"}
  end

  # Converte dólares americanos (usd) para reais (brl)
  def converter(valor, {:usd, :brl}) do
    {:ok, valor * 5.50}
  end

  # Converte euros (EUR) para reais (BRL).
  def converter(valor, {:eur, :brl}) do
    {:ok, valor * 6.00}
  end

  # Converte reais (BRL) para dólares americanos (USD).
  def converter(valor, {:brl, :usd}) do
    {:ok, valor / 5.50}
  end

  # Trata conversões que não foram implementadas.
  def converter(_valor, _moedas) do
    {:error, :conversao_nao_suportada}
  end

end
