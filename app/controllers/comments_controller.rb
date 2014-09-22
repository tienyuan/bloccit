class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    authorize @comment
    if @comment.save
      flash[:notice] = "Comment saved sucessfully."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
    redirect_to [@topic, @post]
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    redirect_to [@topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
