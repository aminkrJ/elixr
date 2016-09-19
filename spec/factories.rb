FactoryGirl.define do
  factory :article do
    title "MyString"
    description "MyString"
    category "MyString"
    content "MyText"
  end
  factory :subscriber do
    email "MyString"
    full_name "MyString"
    subscribed_to "MyString"
  end
  factory :ingredient_category do
    title "MyString"
    description "MyString"
    color "MyString"
  end
  factory :intake do
    age_from 1
    age_to 3
    amount 1.5
    period "Daily"
  end
  factory :cook do
    name "MyString"
  end
  factory :ingredient_nutrition_fact do
    ingredient
    unit
    amount 10.5
  end
  factory :recipe_category do
    name "MyString"
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
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
  factory :admin do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
end
