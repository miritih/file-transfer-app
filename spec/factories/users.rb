FactoryBot.define do

  factory :user do
    ps = "#{Faker::Internet.password}"
    email { "#{Faker::Name.first_name}.#{Faker::Lorem.word}@andela.com" }
    password { ps }
    password_confirmation { ps }
  end

  
end