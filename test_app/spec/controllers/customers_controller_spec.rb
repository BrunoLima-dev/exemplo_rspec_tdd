require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "GET #index" do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
    # Os dois teste fazem a mesma coisa
    it 'status http 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
