FactoryGirl.define do
  factory :product_ingredient do
    product
    ingredient
    percentage 10
    weight 10
    max_percentage 90
    min_percentage 10
  end
  factory :coupon do
    code "SF1"
    amount 1
    rule 'rule1'
    active true
  end
  factory :customer do
    stripe_customer_id "abcdefgh"
    address "30 Albany"
    suburb "ST Leonards"
    city "Sydney"
    country "Australia"
    postcode "2065"
    state "NSW"
    email "test@email.com"
    name_on_card "Amin Karaji"
  end
  factory :carts_product do
    cart
    product
    count 1
  end
  factory :cart do
    total "9.99"
    price "9.99"
    quantity 1
    customer
  end
  factory :admin_meal, class: 'Admin::Meal' do
    name "MyString"
    description "MyString"
    light false
    vegan false
    raw false
    gluten_free false
    organic false
  end
  factory :restaurant do
    sequence(:name) { |n| "restaurant#{n}"}
    address "MyString"
  end
  factory :product do
    name "MyString"
    description "MyString"
    price "9.99"
    primary false
  end
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
  factory :recipe_ingredient do
    recipe
    ingredient
    amount 100
  end
  factory :recipe do
    sequence(:title) { |n| "recipe#{n}"}
  end
  factory :ingredient do
    sequence(:name) { |n| "ingredient#{n}"}
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
