# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { FFaker::Name.name }
    body { FFaker::Lorem.paragraphs(2) }
    association :user
  end
end
