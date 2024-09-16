require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'id valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  it 'is invalid without description' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without prince' do
    product = build(:product, prince: nil)
    product.valid?
    expect(product.errors[:prince]).to include("can't be blank")
  end

  it 'is invalid without category' do
    product = build(:product, category: nil)
    product.valid?
    expect(product.errors[:category]).to include("can't be blank")
  end

  it 'returns a product with a full description' do
    product = create(:product)
    expect(product.full_description).to eq("#{product.description} - #{product.prince}")
  end
end
