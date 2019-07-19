class Admin::GistsController < Admin::BaseController
  before_action :find_gists, only: [:index]

  def index
  end

  private

  def find_gists
    @gists = Gist.all
  end
end
