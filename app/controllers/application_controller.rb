class ApplicationController < ActionController::Base
  include ApplicationController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_responsive

  before_action :authorize

  private

  def authorize
    @current_user = User.find_by(id: session[:user_id])

    render json: { errors: ['Not authorized'] }, status: :unauthorized unless @current_user
  end
end
