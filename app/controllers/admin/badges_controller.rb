class Admin::BadgesController < Admin::BaseController

  def new
    @badge = Badge.new
    @badges = Badge.all
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge], notice: "Badge have been create"
    else
      render :new
    end
  end

  def show
    @badge = Badge.find(params[:id])
  end

  private

  def badge_params
    params.require(:badge).permit(:rule, :image, :rule_value)
  end
end
