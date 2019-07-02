# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true
end
