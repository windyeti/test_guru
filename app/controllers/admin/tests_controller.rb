class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :edit, :update, :destroy]
  before_action :find_gists, only: [:index]

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
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_gists
    @gists = Gist.all
  end

  def rescue_with_not_found_test
    render plain: t('tests.rescue_with_not_found_test.not_found_test')
  end
end
