class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  def index
  end

  def new
  end

  def show
  end
end
