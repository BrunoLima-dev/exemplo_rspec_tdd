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
    before do
      @menber = create(:menber)
      @customer = create(:customer)
    end

    # Teste da resposta do controller se é um json
    it 'content-type JSON' do
      customer_params = attributes_for(:customer)
      sign_in @menber
      post :create, format: :json, params: { customer: customer_params }
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    context 'Teste de flash notice' do
      it 'Flash Notice' do
        customer_params = attributes_for(:customer)
        sign_in @menber
        post :create, params: { customer: customer_params }
        expect(flash[:notice]).to match(/successfully created/)
      end
    end

    context 'testando uma entrada' do
      it 'with valid attributes' do
        customer_params = attributes_for(:customer)
        sign_in @menber
        expect {
          post :create, params: { customer: customer_params }
        }.to change(Customer, :count).by(1)
      end

      it 'with invalid attributes' do
        customer_params = attributes_for(:customer, address: nil)
        sign_in @menber
        expect {
          post :create, params: { customer: customer_params }
        }.not_to change(Customer, :count)
      end
    end

    it 'response a 200 menber' do
      sign_in @menber

      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      sign_in @menber

      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
