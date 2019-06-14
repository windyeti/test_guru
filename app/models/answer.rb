class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  scope :correct, -> { where(correct: true)}

  validates :body, presence: true

  validate :count_answers_in_question, on: :create

  def count_answers_in_question
    count = question.answers.count
    errors.add(:count_answers_in_question, "Counter of answers should be in range 1..4") if count >= 4
  end

end
