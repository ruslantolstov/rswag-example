# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_secure_token :authentication_token

  has_many :articles, dependent: :destroy
end
