require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  # Teste para verificar se o usuário não logado consegue acessar a página
  describe 'as a Guest' do
    context 'index' do
      # Os dois teste fazem a mesma coisa
      it 'responds successfully' do
        get :index
        expect(response).to be_successful
      end

      it 'status http 200' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'show' do
      it 'responds a 302 response (not authorized)' do
        create(:customer)
        get :show, params: { id: Customer.first.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  # Teste para verificar se o usuário logado consegue acessar a página
  describe 'as Logged Member' do
    it 'response a 200 menber' do
      menber = create(:menber)
      customer = create(:customer)

      sign_in menber

      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      menber = create(:menber)
      customer = create(:customer)

      sign_in menber

      get :show, params: { id: customer.id }
      expect(response).to render_template(:show)
    end
  end
end
