FactoryBot.define do
  factory :post do
    title { 'Sample Post' }
    text { 'This is a sample post.' }
    comment_counter { 0 }
    like_counter { 0 }
    association :author, factory: :user
  end
end
