FactoryBot.define do
  factory :customer, aliases: [:user] do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    # Atributo transitorio, não é salvo no banco de dados
    # serve para passar um valor temporário para o objeto
    transient do
      upcased { false }
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased # Se upcased for true, name recebe o valor em maiúsculo
    end
  end
end
