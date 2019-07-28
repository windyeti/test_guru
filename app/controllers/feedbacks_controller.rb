class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.valid?
      FeedBacksMailer.feedback_message(params[:feedback]).deliver_now
      flash[:notice] = "Ваш запрос отправлен"
      if current_user.present?
        redirect_to tests_path
      else
        redirect_to new_user_session_path
      end
    else
      render :new
    end
  end
end
