class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        # log_inというヘルパーがSessions_helper.rbに存在
        log_in @user
        # Userモデルにrememberというメソッドが存在
        # チェックボックスにチェックがあるかどうかで分岐させる
        params[:session][:remember_me] == '1'? remember(@user):forget(@user)
        # redirect_to user_url(@user)と一緒
        # redirect_to @user
        redirect_back_or @user
      else
        message = "Account not activated"
        message += "Check your email for the action link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
