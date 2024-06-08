class UserSessionsController < ApplicationController
  def new
    @user = login(params[:email], params[:password])
  end

  def create
    
  end

  def destroy
  end
end
