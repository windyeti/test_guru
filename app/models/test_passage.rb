class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.passed = true if successful?
    save!
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def completed?
    current_question.nil?
  end

  def percentage_passage
    (correct_questions.to_f / test.questions.count.to_f) * 100
  end

  def successful?
    percentage_passage >= 85
  end

  def number_question
    test.questions.index(current_question) + 1
  end

  def set_current_question
    if new_record?
      test.questions.first if current_question.nil?
    else
      test.questions.order(:id).where("id > ?", current_question.id).first
    end
  end

  private

  def before_validation_set_question
    self.current_question = set_current_question
  end
end
