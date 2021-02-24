class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :college
      t.string :wins
      t.string :biography

      t.timestamps
    end
  end
end
