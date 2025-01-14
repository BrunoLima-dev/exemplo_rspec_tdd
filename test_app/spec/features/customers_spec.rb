require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  it 'Visit index page' do
    visit(customers_path)
    # print(page.html) # mostrar o html da página no terminal
    # save_and_open_page # salva a página em um arquivo e abrir
    # page.save_and_open_screenshot('screenshot1.png') # salva e abre o screenshot
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end

  it 'Create a Customer' do
    menber = create(:menber)
    login_as(menber, scope: :menber)

    visit(new_customer_path)

    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    click_button('Save Customer')

    expect(page).to have_content('Customer was successfully created.')
  end
end
