class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  scope :correct, -> { where(correct: true)}

  validates :body, presence: true

  validate :count_answers_in_question, if: :answer?
  # validates_associated :question
  #

  def count_answers_in_question
    count = Answer.where(question_id: question_id).count
    errors.add(:count_answers_in_question, "Counter answer should be in range 1..4") if count > 3
  end

  def answer?
    Answer.exists?(question_id: question_id)
  end
end
