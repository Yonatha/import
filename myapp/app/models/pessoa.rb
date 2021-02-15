class Pessoa < ApplicationRecord
  validates  :comprador, presence: true
  validates  :descricao, presence: true
  validates  :preco, presence: true
  validates  :quantidade, presence: true
  validates  :endereco, presence: true
  validates  :fornecedor, presence: true
end
