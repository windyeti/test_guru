class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :require_admin!

  private

  def require_admin!
    redirect_to tests_path, :alert => "You have not permission" unless admin_class?
  end

  def admin_class?
    current_user.is_a?(Admin)
  end
end
