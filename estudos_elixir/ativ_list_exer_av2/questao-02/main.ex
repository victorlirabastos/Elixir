defmodule Geometria do

  # Calcula a área de um retângulo com dimensões válidas.
  def area(%{tipo: :retangulo, largura: l, altura: a})
      when is_number(l) and is_number(a) and l > 0 and a > 0 do
    {:ok, l * a}
  end

  # Calcula a área de um quadrado com lado válido.
  def area(%{tipo: :quadrado, lado: l})
      when is_number(l) and l > 0 do
    {:ok, l * l}
  end

  # Calcula a área de um círculo com raio válido.
  def area(%{tipo: :circulo, raio: r})
      when is_number(r) and r > 0 do
    {:ok, :math.pi() * :math.pow(r, 2)}
  end

  # Trata retângulos com dimensões numéricas inválidas.
  def area(%{tipo: :retangulo, largura: l, altura: a})
      when is_number(l) and is_number(a) do
    {:error, :dimensoes_invalidas}
  end

  # Trata quadrados com dimensões numéricas inválidas.
  def area(%{tipo: :quadrado, lado: l})
      when is_number(l) do
    {:error, :dimensoes_invalidas}
  end

  # Trata círculos com dimensões numéricas inválidas.
  def area(%{tipo: :circulo, raio: r})
      when is_number(r) do
    {:error, :dimensoes_invalidas}
  end

  # Trata mapas malformados, dimensões não numéricas e formas desconhecidas.
  def area(_forma) do
    {:error, :forma_desconhecida}
  end

end
