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
end
