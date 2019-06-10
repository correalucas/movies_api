class ApplicationController < ActionController::API
  before_action :authenticate

  def current_user
    @user
  end

  private

  def authenticate
    set_current_user || render_unauthorized
  end

  def set_current_user
    @user = User.find_by(id: params[:user_id])
  end

  def render_unauthorized
    render json: { error: :unauthorized }, status: :unauthorized
  end
end
