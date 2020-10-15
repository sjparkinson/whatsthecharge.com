# Controller to handle requests to the root of the application.
class IndexController < ApplicationController
  # Redirect requests for the root to a URL with a country.
  def root
    # A country param will be added to root_url by ApplicationController#default_url_options.
    redirect_to root_path
  end

  def index
  end

  def healthz
    render plain: "OK"
  end
end
