# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { FFaker::Internet.email }
    password { SecureRandom.hex }
  end
end
