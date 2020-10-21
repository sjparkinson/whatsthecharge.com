class Manage::ApplicationController < ApplicationController
  before_action :authorized

  private

  # Only allow logged in users to access /manage
  def authorized
    redirect_to login_path unless logged_in?
  end
end
