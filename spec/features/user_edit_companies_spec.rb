require 'rails_helper'

feature 'user edit companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')
    visit edit_company_path(company)

    fill_in 'Nome',       with: 'Locaweb'
    fill_in 'Local',      with: 'Rio de Janeiro'
    fill_in 'Email',      with: 'contato@locaweb.com'
    fill_in 'Telefone',   with: '2336-9875'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Locaweb')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('contato@locaweb.com')
    expect(page).to have_content('2336-9875')
  end

  scenario 'with invalid data' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')
    visit edit_company_path(company)

    fill_in 'Nome',       with: ''
    fill_in 'Local',      with: ''
    fill_in 'Email',      with: ''
    fill_in 'Telefone',   with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content('Não foi possivel atualizar a empresa')
  end
end
