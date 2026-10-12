defmodule Cadastro do

  # Função pública: coordena as validações do usuário.
  def processar_usuario(%{nome: nome, email: email, idade: idade}) do
    with {:ok, nome_validado} <- validar_nome(nome),
         {:ok, email_validado} <- validar_email(email),
         {:ok, idade_validada} <- validar_idade(idade) do

      {:ok,
       %{
         nome: nome_validado,
         email: email_validado,
         idade: idade_validada,
         status: :ativo
       }}
    end
  end

  # Valida se o nome é uma string não vazia.
  defp validar_nome(nome) when is_binary(nome) do
    nome = String.trim(nome)

    if nome != "" do
      {:ok, nome}
    else
      {:error, :nome_invalido}
    end
  end

  # Trata nomes que não sejam strings.
  defp validar_nome(_nome) do
    {:error, :nome_invalido}
  end

  # Valida se o e-mail contém "@" e ".".
  defp validar_email(email) when is_binary(email) do
    if String.contains?(email, "@") and String.contains?(email, ".") do
      {:ok, email}
    else
      {:error, :email_invalido}
    end
  end

  # Trata e-mails que não sejam strings.
  defp validar_email(_email) do
    {:error, :email_invalido}
  end

  # Valida se a idade é um inteiro maior ou igual a 18.
  defp validar_idade(idade) when is_integer(idade) and idade >= 18 do
    {:ok, idade}
  end

  # Trata usuários menores de idade.
  defp validar_idade(idade) when is_integer(idade) and idade < 18 do
    {:error, :menor_de_idade}
  end

  # Trata idades que não sejam números inteiros.
  defp validar_idade(_idade) do
    {:error, :idade_invalida}
  end

end
