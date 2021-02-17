require 'rails_helper'

feature 'Employee register a vacancy' do
  scenario 'successfully' do
    user = User.create!(email: 'guilherme@rebase.com.br', password: '123456', name: 'Guilherme Feitosa', cpf: '123.456.789-52', number: 1142536985, user_type: 5)
    employee = Employee.create!(user: user, company: '@rebase.com.br', admin: true)
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas'
    click_on 'Cadastrar nova vaga'
    fill_in 'Título', with: 'Desenvolvedor Jr. Ruby on Rails'
    fill_in "Faixa salarial",	with: "R$2.500"
    fill_in "Local",	with: "Remoto" 
    check "Seguro de Vida" 
    check "Assistência Médica" 

  end

  scenario 'and only see vancancies from his company' do
  end
end