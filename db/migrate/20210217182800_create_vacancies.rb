class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.integer :num_candidates
      t.integer :salary
      t.string :local
      t.string :description
      t.string :requirements

      t.timestamps
    end
  end
end
