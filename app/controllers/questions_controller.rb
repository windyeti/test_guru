class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:show, :destroy]

  # helper_method :current_test_id

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    list = @test.questions.map(&:body).join(", ")
    render plain: list
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = @test.questions.create(question_params)
    render plain: question.body
  end

  def destroy
    @question.destroy
    render plain: "Question was destroyed"
  end

  # def current_test_id
  #   @test.id
  # end

  private

  def rescue_with_question_not_found
    render plain: "Question not found!!!"
  end
  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
end
