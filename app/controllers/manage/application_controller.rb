class Manage::ApplicationController < ApplicationController
  skip_before_action :set_country

  before_action :authorized
  before_action :add_x_robots_tag

  helper_method :current_user
  helper_method :logged_in?

  # Vary the cache by current_user (or not logged in).
  etag { current_user.try :id }

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

  # Only allow logged in users to access /manage.
  def authorized
    redirect_to login_path unless logged_in?
  end

  # Prevent robots from indexing these pages.
  def add_x_robots_tag
    response.set_header 'x-robots-tag', 'noindex'
  end
end
