class ApplicationController < ActionController::Base
  before_action :set_current_country

  helper_method :current_user
  helper_method :logged_in?

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs in the given user.
  def login(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def logout
    reset_session
    @current_user = nil
  end

  private

  def set_current_country
    @current_country = Country.find_by(countryCode: params[:countryCode])
  end
end
