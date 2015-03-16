class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize
    redirect_to new_session_path, alert: "You are not authorized for that action. Please sign in" if current_user.nil?
  end
end
