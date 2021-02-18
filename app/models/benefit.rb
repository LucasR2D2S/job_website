class Benefit < ApplicationRecord
  has_many :benefits_vacancies
  has_many :vacancy, through: :benefits_vacancies
end
