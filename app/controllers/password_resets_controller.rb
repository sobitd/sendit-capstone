class PasswordResetsController < ApplicationController
  def edit
    # finds user with a valid token
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    # update user's password
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password was changed successfully. Please sign in'
    else
      render :edit
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.present?
      # send mail
      PasswordMailer.with(user: @user).reset.deliver_later
      # deliver_later is provided by ActiveJob
    end
    redirect_to root_path, notice: 'Please check your email to reset the password'
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
