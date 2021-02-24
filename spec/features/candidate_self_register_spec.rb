require 'rails_helper'

feature 'Candidate self register' do 
  scenario 'successfully' do

    visit root_path
    click_on 'Registrar-se'
    click_on 'Candidato'
    fill_in "E-mail",	with: "lucas@gmail.com" 
    fill_in "Senha",	with: "lucas123456"
    fill_in "Confirme sua senha",	with: "lucas123456"
    fill_in "Nome Completo",	with: "Lucas Ricardo dos Santos" 
    fill_in "CPF",	with: "424.699.757-99"
    fill_in "Celular",	with: "11988421402"
    fill_in "Faculdade",	with: "Universidade de São Paulo"
    fill_in "Conquistas",	with: "Projeto em Ruby on Rails link: https://github.com/LucasR2D2S/job_website"
    fill_in "Biografia",	with: "Me formei em tecnologia para ajudar as pessoas e tenho um interesse 
    em Front-End."
    click_on 'Concluir cadastro'

    expect(current_path).to eq vacancies_path

  end
end