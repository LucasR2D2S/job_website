require 'rails_helper'

feature 'Employee register a vacancy' do
  scenario 'successfully' do
    user = User.create!(email: 'guilherme@rebase.com.br', password: '123456', name: 'Guilherme Feitosa', cpf: '123.456.789-52', number: 1142536985, user_type: 5)
    employee = Employee.create!(user: user, company: '@rebase.com.br', admin: true)
    company = Company.create!(name: 'Rebase', cnpj: '42.318.949/0001-84', address: 'Rua da Rebase, 1234', company_email: 'rebase.com.br')
    benefit = Benefit.create!(name: 'Seguro de Vida')
    other_benefit = Benefit.create!(name: 'Assistência Médica')
    login_as user, scope: :user

    visit root_path
    click_on 'Vagas'
    click_on 'Cadastrar nova vaga'
    fill_in 'Título da vaga', with: 'Desenvolvedor Jr. Ruby on Rails'
    fill_in "Quantidade de cadidatos",	with: "5" 
    fill_in "Faixa salarial",	with: "R$2.500"
    fill_in "Local",	with: "Remoto"  
    fill_in "Descrição", with: "Uma vaga para aqueles que tem sede de conhecimento e estão começando a sua jornada no mundo de programação agora."
    fill_in 'Requisitos', with: '-Ruby on Rails
    -Bootstrap
    -HTML5 e CCSS'
    click_on "Concluir cadastro"

    expect(current_path).to eq vacancies_path
    expect(page).to have_content "Desenvolvedor Jr. Ruby on Rails"
    expect(page).to have_content "Remoto"
  end

  scenario 'and only see vancancies from his company' do
  end
end