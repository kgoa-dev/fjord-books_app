# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # フォロー一覧
  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  # フォロワー一覧
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
