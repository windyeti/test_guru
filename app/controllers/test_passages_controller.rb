class TestPassagesController < ApplicationController

  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show; end

  def result; end

  def update
    time_left = @test_passage.has_time
    @test_passage.accept!(params[:answer_ids], time_left)

    if @test_passage.completed?(time_left)
      current_user.badges << AwardsService.new(@test_passage).check
      ResultTestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    if result.success?
      Gist.create(
          question_id: @test_passage.current_question[:id],
          user_id: @test_passage.user_id,
          url: result.gist_url
      )
      flash[:notice] = t('.success', url: result.gist_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
