FactoryGirl.define do
  factory :place do
    name "Lulu's Bakery"
    address "123 Fake St"
    description "Try the cupcakes"
    latitude(42.3631519)
    longitude(-71.056098)
    association :user
  end
end