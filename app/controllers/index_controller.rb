# Controller to handle requests to the root of the application.
class IndexController < ApplicationController
  skip_before_action :set_country

  def root
    redirect_to networks_path
  end

  def healthz
    render plain: 'OK'
  end
end
