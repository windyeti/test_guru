# require '../models/feedback'
class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new;
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.valid?
      FeedBacksMailer.feedback_message(params[:feedback]).deliver_now
      redirect_to tests_path, notice: "Ваш запрос отправлен"
    else
      render :new
    end
  end
end
