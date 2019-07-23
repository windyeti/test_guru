class Admin::TestsController < Admin::BaseController

  before_action :find_tests, only: [:index, :update_inline]
  before_action :find_test, only: [:show, :edit, :update, :destroy, :update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found_test

  def index
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

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
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

  def find_tests
    @tests = Test.all.order(:id)
  end

  def rescue_with_not_found_test
    render plain: t('tests.rescue_with_not_found_test.not_found_test')
  end
end
