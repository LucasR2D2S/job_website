class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.boolean :admin

      t.timestamps
    end
  end
end
