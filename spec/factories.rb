FactoryGirl.define do
  factory :cook do
    name "MyString"
  end
  factory :ingredient_category do
    
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
