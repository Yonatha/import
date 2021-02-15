require 'test_helper'

class PessoaTest < ActiveSupport::TestCase
  test 'Salvar pessoa preenchendo todos os atributos' do
    pessoa = pessoas(:completo)
    assert pessoa.valid?
  end

  test 'Salvar pessoa preenchendo não informando todos os atributos' do
    pessoa = pessoas(:incompleto)
    assert_not pessoa.valid?, pessoa.errors.full_messages.inspect
  end

  test 'Todos os atributos vazios' do
    pessoa = pessoas(:vazia)
    assert_not pessoa.valid?, pessoa.errors.full_messages.inspect
  end

  test 'O preço não pode ser negativo' do
    pessoa = pessoas(:preco_invalido)
    assert_not pessoa.preco >= 0
  end

  test 'A quantidade não pode ser negativa' do
    pessoa = pessoas(:quantidade_invalida)
    assert_not pessoa.quantidade >= 0
  end
end