FactoryGirl.define do
  factory :intake do
    age_from 1
    age_to 3
    amount 1.5
    period "Daily"
  end
  factory :cook do
    name "MyString"
  end
  factory :recipe_category do
    name "MyString"
  end
  factory :user do
    email 'amin.krj@gmail.com'
    password '12345678'
  end

  factory :unit do
    name 'Gram'
    symbol 'g'
  end

  factory :ingredient do
    name 'zucchini'
    amount 100
    unit
  end
end
