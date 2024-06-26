class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger, :alert, :notice

  private

  def not_authenticated
    redirect_to root_path
  end
end
