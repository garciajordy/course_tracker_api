FactoryBot.define do
  factory :measurement do
    amount { 200 }
    user { create(:user) }
    course { Course.find_or_create_by(name: 'JavaScript') }
  end
end
