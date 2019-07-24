class TestsController < ApplicationController
  before_action :find_test, only: [:start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found_test

  def index
    @tests = Test.all.order(:id)
  end

  def start
    current_user.tests << @test
    redirect_to  current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_not_found_test
    render plain: t('tests.rescue_with_not_found_test.not_found_test')
  end
end
