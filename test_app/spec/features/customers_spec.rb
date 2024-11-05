require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  it 'Visit index page' do
    visit(customers_path)
    print(page.html) # mostrar o html da página no terminal
    # save_and_open_page # salva a página em um arquivo
    # page.save_screenshot('customers.png')
    expect(page).to have_current_path(customers_path)
  end
end
