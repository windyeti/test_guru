class Admin::BaseController < ApplicationController
  # layout 'admin'

  before_action :require_admin!

  private

  def require_admin!
    redirect_to tests_path, :alert => t('admin.not_permissions') unless current_user.admin?
  end

end
