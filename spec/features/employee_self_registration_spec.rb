require 'rails_helper'

feature 'employee self registration' do
  scenario 'is it the first one the company' do 
    visit root_path
    click_on 'Registrar-se'
    click_on 'Funcionário'
    fill_in "E-mail:",	with: "lucas@rebase.com.br" 
    fill_in "Senha:",	with: "lucas123456"
    fill_in "Confirme sua senha:",	with: "lucas123456"
    fill_in "Nome Completo:",	with: "Lucas Ricardo Rodelo Fontes dos Santos" 
    fill_in "CPF:",	with: "425.698.753-98"
    fill_in "Empresa:",	with: "Rebase"
    click_on 'Concluir cadastro'

    expect(current_path).to eq new_company_path
    expect(page).to have_content 'Sua empresa não está cadastrada ainda,
                              preencha os campos abaixo por favor'    
  end

  scenario 'successfully' do
    company = Company.create!(name: 'Rebase', cnpj: '42.318.949/0001-84', address: 'Rua da Rebase, 1234', company_email: 'rebase.com.br')

    visit root_path
    click_on 'Registrar-se'
    click_on 'Funcionário'
    fill_in "E-mail",	with: "lucas@rebase.com.br" 
    fill_in "Senha",	with: "lucas123456"
    fill_in "Confirme sua senha",	with: "lucas123456"
    fill_in "Nome Completo",	with: "Lucas Ricardo Rodelo Fontes dos Santos" 
    fill_in "CPF",	with: "425.698.753-98"
    fill_in "Celular",	with: "11988421402"
    click_on 'Concluir cadastro'

    expect(current_path).to eq index_vacancy_path
  end
end