class Vacancy < ApplicationRecord
  has_many :benefits_vacancies
  has_many :benefits, through: :benefits_vacancies

  serialize :applicants,Array
end
