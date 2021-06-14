FactoryBot.define do
  factory :user do
    email { 'jordy@gmail.com' }
    password_digest { '123456' }
  end
end
