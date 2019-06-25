class User < ActiveRecord::Base
  has_many :questions, inverse_of: :asker
  has_many :answers,   inverse_of: :answerer

  def as_json(*)
    {
      id: id,
      name: name
    }
  end
end
