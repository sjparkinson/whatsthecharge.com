class Manage::ApplicationController < ApplicationController
  before_action :authorized
  before_action :add_x_robots_tag

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
