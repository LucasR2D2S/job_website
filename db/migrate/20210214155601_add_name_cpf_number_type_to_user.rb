class AddNameCpfNumberTypeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :number, :integer
    add_column :users, :type, :integer
  end
end
