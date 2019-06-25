class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :user

  scope :not_private, -> { where(private: false) }

  scope :for_answers, lambda { |question_id|
    joins(:answers).where(answers: { question_id: question_id }) if question_id.present?
  }

  scope :for_question_user, lambda { |user_id|
    joins(:user).where(user: { user_id: user_id }) if user_id.present?
  }

  scope :for_answer_user, -> { joins(:answers, :user) }

  scope :for_question_query, lambda { |title|
    where('title LIKE ?', "%#{title}%") if title.present?
  }

  def as_json(*)
    {
      title: title,
      private: private,
      user: user.as_json,
      answers: answers.as_json
    }
  end
end
