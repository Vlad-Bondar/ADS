# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    header { 'test' }
    body { 'test' }

    association :user, factory: :user
    association :category, factory: :category
  end
end
