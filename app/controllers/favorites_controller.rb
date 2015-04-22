class FavoritesController < ApplicationController
  respond_to :html, :js
  
  def create
    @user = User.find(params[:user_id])
    @beat = Beat.find(params[:beat_id])
    @favorite = @user.favorites.create(favorite_params)
    @favorites = Favorite.all
    
    flash[:notice] = "Favorite successfully added" if @favorite.save
    respond_with( @favorite, :layout => !request.xhr? )
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @favorite = @user.favorites.find(params[:id])
    
    flash[:notice] = "Favorite successfully removed" if @favorite.destroy
    respond_with( @favorites, :layout => !request.xhr? )
  end
  
  private
    def favorite_params
      params.permit(:user_id, :beat_id)
    end  
end
