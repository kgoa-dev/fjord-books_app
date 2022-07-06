# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  before_action :set_book, only: %i[create destroy]

  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to @user
  end

  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to @user
  end

  private

  def set_book
    @user = User.find(params[:user_id])
  end
end
