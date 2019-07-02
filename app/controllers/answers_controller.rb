class AnswersController < ApplicationController
  before_action :find_question, only: [:new, :create]
  before_action :find_answer, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @answer = Answer.new
  end

  def edit; end


  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @answer, notice: 'Ответ создан'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

    def find_answer
      @answer = Answer.find(params[:id])
    end

    def find_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end