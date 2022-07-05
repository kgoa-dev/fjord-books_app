# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit destroy update]

  # GET /reports/1/edit
  def edit; end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commentable, notice: 'Report was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to @commentable, content: t('controllers.common.content_create')
    else
      render :new
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
