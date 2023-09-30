FactoryBot.define do
  factory :user do
    name { 'Supreeti' }
    photo { 'Image' }
    bio { 'developer' }
    post_counter { 0 }
  end
end
