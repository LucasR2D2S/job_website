require 'rails_helper'

feature 'Employee admin register company' do
  scenario 'is employee admin?' do
    user = User.create!(email: 'guilherme@rebase.com.br', password: '123456', name: 'Guilherme Feitosa', cpf: '123.456.789-52', number: 1142536985, user_type: 0)
    employee = Employee.create!(user: user, company: '@rebase.com.br', admin: false)
    login_as user, scope: :user

    visit new_company_path

    expect(page).to have_content 'Só o admin pode registar ou editar dados da empresa. Procure o primeiro funcionário cadastrado.'
  end

  scenario 'successfully with an logo' do
    user = User.create!(email: 'guilherme@rebase.com.br', password: '123456', name: 'Guilherme Feitosa', cpf: '123.456.789-52', number: 1142536985, user_type: 5)
    employee = Employee.create!(user: user, company: '@rebase.com.br', admin: true)
    login_as user, scope: :user

    visit new_company_path

    attach_file 'Logo da Empresa', Rails.root.join('spec', 'support', 'rebase.png')
    fill_in "Nome",	with: "Rebase" 
    fill_in "CNPJ",	with: "65.412.753/0001-49" 
    fill_in "Endereço",	with: "Rua Jaracu, 4526"
    click_on 'Concluir cadastro' 

    expect(current_path).to eq vacancies_path
    # have_css('img[src*="contos_de_terramar.png"]')
  end

  scenario 'successfully' do
    user = User.create!(email: 'guilherme@rebase.com.br', password: '123456', name: 'Guilherme Feitosa', cpf: '123.456.789-52', number: 1142536985, user_type: 5)
    employee = Employee.create!(user: user, company: '@rebase.com.br', admin: true)
    login_as user, scope: :user

    visit new_company_path

    fill_in "Nome",	with: "Rebase" 
    fill_in "CNPJ",	with: "65.412.753/0001-49" 
    fill_in "Endereço",	with: "Rua Jaracu, 4526"
    click_on 'Concluir cadastro' 

    expect(current_path).to eq vacancies_path
    expect(page).to have_content 'A sua empresa não tem vagas, comece cadastrando alguma agora :)'
  end
end
