class AddContatoToTelefone < ActiveRecord::Migration[5.1]
  def change
    add_reference :telefones, :contato, foreign_key: true
  end
end
