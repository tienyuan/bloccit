class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post)

    authorize @favorite
    if @favorite.save
      flash[:notice] = "Favorite saved sucessfully."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the favorite. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by_post_id(@post.id)

    authorize @favorite
    if @favorite.destroy
      flash[:notice] = "Favorite deleted successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error deleting the favorite. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

end