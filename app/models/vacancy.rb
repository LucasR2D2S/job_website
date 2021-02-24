class Vacancy < ApplicationRecord
  has_many :benefits_vacancies
  has_many :benefits, through: :benefits_vacancies

  serialize :applicants,Array

  def candidate_applied?(candidate)
    #puts self.title
    #puts self.applicants.empty?
    #self.applicants.include? candidate
  end
end

#<% if vacancy.candidate_applied?(current_user.candidate_find(current_user)) %>
      #<dd>
        #<small>Vaga aplicada!</small>
      #</dd>
    #<% end %>