class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to @commentable, content: t('controllers.common.content_create')
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
