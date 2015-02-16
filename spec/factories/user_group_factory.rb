FactoryGirl.define do
  factory :user_group, class: Spree::UserGroup do
    name { "Wholesaler" }
    calculator { Spree::Calculator::PerVariantPricing.new }
  end
end