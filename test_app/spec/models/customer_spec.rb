require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it 'Createa Customer' do
    customer = customers(:bruno)

    # subject.name = 'Bruno Lima'
    # subject.email = 'brunolima@gmail.com' // podemos troca essa parte por FIXTURES
    # subject.save

    expect(customer.full_name).to eq('Sr. Bruno Lima')
  end
end
