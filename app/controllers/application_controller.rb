# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_account_update_params, if: :devise_controller?

  protected

  def after_sign_out_path_for(_resource)
    books_path
  end

  def after_update_path_for(_resource)
    # 自分で設定した「マイページ」へのパス
    users_path(current_user)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[postal_code address self_introduction])
  end
end
