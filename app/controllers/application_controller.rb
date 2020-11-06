class ApplicationController < ActionController::Base
  before_action :set_countries

  private

  def set_countries
    @countries = Country.all.select(:name, :countryCode)
    @country = Country.find_by(countryCode: params[:countryCode] || cookies[:countryCode] || 'gb')
  end
end
