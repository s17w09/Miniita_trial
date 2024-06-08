class UsersController < ApplicationController
  def new
    @user = User.new

    if @user.save
      redirecto_to root_path
    else
      render :new
    end
  end
end
