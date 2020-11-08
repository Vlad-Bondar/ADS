# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name { 'John' }
    sequence(:email) { |i| "user@#{i}test.test" }
    password { 'test123' }
    confirmed_at { Time.now }
    admin { false }
  end
  factory :admin, class: 'User' do
    user_name { 'Admin' }
    sequence(:email) { |i| "admin@#{i}test.test" }
    password { 'test123' }
    confirmed_at { Time.now }
    admin { true }
    super_admin { true }
  end
end
