class ApplicationController < ActionController::Base
  # クロスサイトスクリプティングの防止
  protect_from_forgery with::exception

  def hello
    render html: "hello, world!"
  end
end
