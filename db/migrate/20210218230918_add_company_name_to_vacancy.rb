class AddCompanyNameToVacancy < ActiveRecord::Migration[6.1]
  def change
    add_column :vacancies, :company_name, :string
  end
end
