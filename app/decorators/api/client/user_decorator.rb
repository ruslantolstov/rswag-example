# frozen_string_literal: true

module Api
  module Client
    class UserDecorator < Draper::Decorator
      delegate_all

      def as_json(*)
        json = {
          id: id,
          email: email
        }
        json
      end
    end
  end
end
