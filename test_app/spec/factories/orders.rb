FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n} (fábrica == factory)" }
    association :customer, factory: :customer
    # customer é a mesma coisa que => association :customer, factory: :customer
  end
end
