class Admin::TestsController < ApplicationController
  before_action :require_admin!
  before_action :find_test, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found_test

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def require_admin!
    redirect_to tests_path, :alert => "You have not permission" unless class?
  end

  def class?
    current_user.is_a?(Admin)
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_not_found_test
    render plain: 'Not found test'
  end
end
