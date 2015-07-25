# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    sequence(:entry_id)  { |n| "ENTRY_#{n}" }

    uri          'http://url'
    description  'description'
    title        'title'
    content      {}
    categories   ['cat1', 'cat2']
    author       'Author'
    published_at Time.now.utc
  end
end
