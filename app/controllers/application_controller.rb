class ApplicationController < ActionController::Base
  # クロスサイトスクリプティングの防止
  protect_from_forgery with: :exception
  # SessionHelperを読み込む。これでこのアプリのどこでもヘルパーが使える
  include SessionsHelper


  private

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        # 接続するURLを記憶しておく
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
