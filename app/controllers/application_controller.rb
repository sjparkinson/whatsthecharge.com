class ApplicationController < ActionController::Base
  before_action :set_country

  def set_country
    @country = Country.find_by(countryCode: params[:countryCode])
  end
end
