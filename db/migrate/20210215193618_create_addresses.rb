class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :logradouro
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :endereco_completo
      t.string :cep

      t.timestamps
    end
  end
end
