class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:content)
  end

end
