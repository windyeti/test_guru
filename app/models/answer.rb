class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  scope :correct_answer, -> { where(correct: true)}

  validates :body, presence: true

  validates_associated :question

end
