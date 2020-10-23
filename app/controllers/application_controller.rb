class ApplicationController < ActionController::Base
  before_action :set_countries

  private

  def set_countries
    @country = Country.find_by(countryCode: params[:countryCode])
    @countries = Country.all
  end
end
