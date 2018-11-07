FactoryBot.define do
  factory :stock do
    name { 'Stock name' }
    unit_price { 100 }
    interest { 5 }
    duration { 5 }
    user { nil }
  end
end
