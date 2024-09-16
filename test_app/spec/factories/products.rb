FactoryBot.define do
  factory :product do
    description { Faker::Commerce.product_name }
    prince { Faker::Commerce.price }
    category
  end
end
