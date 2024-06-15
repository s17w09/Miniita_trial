class FavoritesController < ApplicationController
  def create
    @first_favorite = current_user.favorites.new(article_id: params[:article_id])
    if @first_favorite.save
      redirect_to article_path(params[:article_id])
    end
  end

  def destroy
    @first_favorite = current_user.favorites.find_by(article_id: params[:article_id])
    if @first_favorite.destroy!
      redirect_to article_path(params[:article_id]), status: :see_other
    end
end
end
