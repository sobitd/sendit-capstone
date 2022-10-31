class SessionsController < ApplicationController
  skip_before_action :authorize, only: :create

  # create method would look up a user in the database, verify their login credentials, and then store the authenticated user's id in the session
  def create
    user = User.find_by(username: params[:username])

    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  #  logging out a user/ delete their session
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end
