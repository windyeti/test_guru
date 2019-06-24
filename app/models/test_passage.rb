class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(ids)
    if correct_answer?(ids)
      self.correct_questions += 1
    end
    save
  end

  def correct_answer?(ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: ids).count) &&
    (correct_answers_count == ids.count)
  end

  def correct_answers
    current_question.answers.correct
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if current_question.nil?
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where("id > ?", current_question.id).first
  end
end
