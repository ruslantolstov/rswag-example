# frozen_string_literal: true

class Admin < ApplicationRecord
  has_secure_password
  has_secure_token :authentication_token
end
