class Manage::ApplicationController < ApplicationController
  before_action :verify_ip_address

  private

  # Only allow specifc IP addresses to access /manage
  def verify_ip_address
    if request.remote_ip != '94.174.58.253'
      render plain: 'Unauthorized', status: :unauthorized
    end
  end
end
