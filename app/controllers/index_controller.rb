# Controller to handle requests to the root of the application.
class IndexController < ApplicationController # A country param will be added to root_url by ApplicationController#default_url_options.
  def root
    redirect_to uk_path
  end

  def uk; end

  def healthz
    render plain: 'OK'
  end
end
