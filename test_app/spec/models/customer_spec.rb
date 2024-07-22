require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'Createa Customer' do
    customer = create(:user) # ou create(:customer)
    expect(customer.full_name).to start_with('Sr. ')
  end

  it 'customer_vip (Herença)' do
    customer = create(:customer_vip)
    expect(customer.vip).to be(true)
  end

  it 'customer_default (Herença)' do
    customer = create(:customer_default)
    expect(customer.vip).to be(false)
  end

  it 'full_name - Sobrescrevendo atributo' do
    customer = create(:customer, name: 'Bruno Lima')
    expect(customer.full_name).to start_with('Sr. Bruno Lima')
  end

  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }

  it 'Usando attibutes for' do
    attrs = attributes_for(:customer) # recebe um hash com os atributos, bom para teste de api json
    attrs1 = attributes_for(:customer_vip)
    attrs2 = attributes_for(:customer_default)
    puts "attrs => #{attrs}"
    puts "attrs1 => #{attrs1}"
    puts "attrs2 => #{attrs2}"
  end

  it 'Atributo attibutes for' do
    attrs = attributes_for(:customer)
    customer = Customer.new(attrs)
    expect(customer.full_name).to start_with('Sr. ')
  end
end
