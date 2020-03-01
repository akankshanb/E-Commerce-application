# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    rating 4
    comment "Great product!"
    item_id 1
    association :item
  end

end