class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger
  rescue_from StandardError, with: :render500

  def render500(error = nil)
    Rails.logger.error("❌#{error.message}") if error
    render template: 'errors/error500', status: :internal_server_error
  end

  private

  def not_authenticated
    redirect_to root_path
  end
end
