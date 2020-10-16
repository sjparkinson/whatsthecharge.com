class Manage::ApplicationController < ApplicationController
  before_action :verify_ip_address

  private

  def verify_ip_address
    render plain: "Unauthorized", status: :unauthorized if request.remote_ip != "94.174.58.253"
  end
end
