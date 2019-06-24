# frozen_string_literal: true

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  def as_json(*)
    {
      body: body,
      user: user.as_json
    }
  end
end
