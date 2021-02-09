class CreatePessoas < ActiveRecord::Migration[5.0]
  def change
    create_table :pessoas do |t|
      t.string :comprador
      t.string :descricao
      t.decimal :preco
      t.decimal :quantidade
      t.string :endereco
      t.string :fornecedor
      t.timestamps
    end
  end
end
