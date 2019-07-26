class FeedbacksController < ApplicationController
  def new
  end

  def create
    @user = current_user
    FeedBacksMailer.feedback_message(params, @user).deliver_now
    redirect_to tests_path
  end
end
