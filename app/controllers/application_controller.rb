class ApplicationController < ActionController::Base
  # クロスサイトスクリプティングの防止
  protect_from_forgery with: :exception
  # SessionHelperを読み込む。これでこのアプリのどこでもヘルパーが使える
  include SessionsHelper
end
