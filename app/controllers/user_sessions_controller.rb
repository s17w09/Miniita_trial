class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = login(params[:email], params[:password])
  end

  def create
    @user = login(params[:email], params[:password])
  
    if @user
      redirect_to articles_path
    else
      redirect_to root_path
    end
  end
end
