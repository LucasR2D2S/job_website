class AddApplicantsToVacancy < ActiveRecord::Migration[6.1]
  def change
    add_column :vacancies, :applicants, :integer
  end
end
