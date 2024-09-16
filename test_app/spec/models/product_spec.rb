require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'id valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  # >> Inicio usando o shoulda-matchers para validar a presença dos atributos <<
  context 'validates' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:prince) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:category) }
  end
  # >> fim do uso do shoulda-matchers <<

  context 'Instace Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.prince}")
    end
  end
end
