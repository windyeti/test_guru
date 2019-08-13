class TestsController < ApplicationController
  before_action :find_test, only: [:start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found_test

  def index
    @tests = Test.all.order(:id)
  end

  def start
    current_user.tests << @test
    test_passage = current_user.test_passage(@test)
    test_passage.timer_limit = @test.timer
    test_passage.start_time_passage = Time.current
    test_passage.save
    redirect_to test_passage
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_not_found_test
    render plain: t('tests.rescue_with_not_found_test.not_found_test')
  end
end
