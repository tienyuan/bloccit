class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
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
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
