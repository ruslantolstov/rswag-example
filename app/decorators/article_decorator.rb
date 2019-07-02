# frozen_string_literal: true

class ArticleDecorator < Draper::Decorator
  delegate_all

  def as_json(*)
    json = {
      id: id,
      title: title,
      body: body
    }
    json
  end
end
