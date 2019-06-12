class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy, inverse_of: :question

  validates :body, presence: true
  validate :validate_count_answers, unless: :count_answers_zero?

  def validate_count_answers
    errors.add(:count_answers, "Counter of answers must be in range 1..4") unless (1...4).include?(answers.count)
  end

  def count_answers_zero?
    answers.count.zero?
  end
end
