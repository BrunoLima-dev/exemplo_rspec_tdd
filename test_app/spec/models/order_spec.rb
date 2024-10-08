require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos - create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    puts "#{customer.inspect} => has_many"
    puts "#{customer.orders.inspect} => has_many"
    expect(customer.orders.count).to eq(5)
  end
end
