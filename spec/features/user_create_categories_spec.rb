require 'rails_helper'

feature 'user create categories' do
  scenario 'successfully' do

    category = Category.new(name: 'Desenvolvedor')
    visit new_category_path

    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)
  end

  scenario 'with invalid data' do
    visit new_category_path
    click_on 'Criar Categoria'

    expect(page).to have_content 'Nao foi possivel criar categoria'
  end
end
