class CreateBenefitsVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :benefits_vacancies do |t|
      t.references :vacancy, null: false, foreign_key: true
      t.references :benefit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
