class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)  # This line might be a problem?  
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment saved sucessfully."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
