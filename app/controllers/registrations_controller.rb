class RegistrationsController < ApplicationController
  # instantiates new user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_now
      # store saved user id in a session
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Yay! your account has successfully been created'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :phone_number, :username, :password,
                                 :password_confirmation)
  end
end
