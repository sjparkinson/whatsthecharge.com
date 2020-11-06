# Controller to handle requests to the root of the application.
class IndexController < ApplicationController
  skip_before_action :set_countries, except: %i[about]

  def root
    redirect_to networks_path(countryCode: 'gb')
  end

  def country
    countryCode = params[:countryCode]
    cookies[:countryCode] = countryCode
    redirect_to networks_path(countryCode: countryCode)
  end

  def healthz
    render plain: 'OK'
  end
end
