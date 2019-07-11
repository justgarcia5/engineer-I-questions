# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name 'Test'
    phone '666-333-3333'
    email 'test2@test2.com'
  end

  factory :user do
    email 'email2@email2.com'
    password '123456'
  end

end
