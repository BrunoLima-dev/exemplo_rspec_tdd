require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'Createa Customer' do
    customer = create(:customer)
    expect(customer.full_name).to eq('Sr. Bruno Lima')
  end
end
