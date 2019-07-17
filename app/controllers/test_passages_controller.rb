require 'gits_question_service'
class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show; end


  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      ResultTestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_option = if result.success?
          { notice: "Удачно добавлено" }
       else
         { alert: "Ошибка при добавлении" }
       end

    redirect_to @test_passage, flash_option
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
