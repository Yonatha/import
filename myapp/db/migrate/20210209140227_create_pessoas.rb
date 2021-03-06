class CreatePessoas < ActiveRecord::Migration[5.0]
  def change
    create_table :pessoas do |t|
      t.string :lote
      t.string :comprador
      t.string :descricao
      t.decimal :preco, :precision => 8, :scale => 2
      t.decimal :quantidade
      t.string :endereco
      t.string :fornecedor
    end
  end
end
