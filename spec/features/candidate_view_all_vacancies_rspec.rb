require 'rails_helper'

feature 'Candidate view all vacancies' do
  scenario 'successfully' do
    company = Company.create!(name: 'Rebase', cnpj: '42.318.949/0001-84', address: 'Rua da Rebase, 1234', company_email: 'rebase.com.br')
    vacancy = Vacancy.create!(title: 'Desenvolvedor Jr. Ruby on Rails', company_name: 'Rebase', num_candidates: 5, salary: 2500, local: 'São Paulo', description: 'Uma vaga para aqueles que tem sede de conhecimento e estão começando a sua jornada no mundo de programação agora.', requirements: '-Ruby on Rails
    -Bootstrap
    -HTML5 e CCSS')
    vacancy = Vacancy.create!(title: 'Desenvolvedor Senior Ruby on Rails', company_name: 'Tijuca Tech', num_candidates: 3, salary: 2300, local: 'Rio de Janeiro', description: 'Ter experiência de no mínimo 5 anos com Ruby on Rails.', requirements: '-Ruby on Rails
    -Bootstrap
    -HTML5 e CCSS
    -5 anos de experiência')

    visit root_path
    click_on 'Vagas'

    expect(page).to have_content 'Desenvolvedor Jr. Ruby on Rails'
    expect(page).to have_content 'São Paulo'
    expect(page).to have_content 'Desenvolvedor Senior Ruby on Rails'
    expect(page).to have_content 'Rio de Janeiro'
  end
end