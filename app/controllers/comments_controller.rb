class CommentsController < ApplicationController
  def new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(post_params)  # This line might be a problem?
    if @comment.save
      flash[:notice] = "Comment saved sucessfully."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:comment).permit(:body)
  end

end
