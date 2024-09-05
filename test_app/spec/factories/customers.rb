FactoryBot.define do
  factory :customer, aliases: [:user] do
    # Atributo transitorio, não é salvo no banco de dados
    # serve para passar um valor temporário para o objeto
    transient do
      upcased { false }
      qtt_orders { 3 }
    end

    name { Faker::Name.name }
    # email { Faker::Internet.email }

    sequence(:email) { |n| "meu_email-#{n}@email.com" }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end

    factory :customer_with_orders, traits: [:with_orders]
    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased # Se upcased for true, name recebe o valor em maiúsculo
    end
  end
end
