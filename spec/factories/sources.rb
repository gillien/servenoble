# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :source do
    sequence(:key)  { |n| "SOURCEKEY#{n}" }
    uri 'http://www.bordernone.com'
    description 'bordernone'
    language 'fra'
  end
end
