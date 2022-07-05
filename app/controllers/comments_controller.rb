class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to @commentable, content: t('controllers.common.content_create')
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
