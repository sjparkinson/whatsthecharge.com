class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  # Vary the cache by current_user (or not logged in).
  etag { current_user.try :id }

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
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
end
