class ApplicationController < ActionController::Base
  before_action :set_countries

  private

  def set_countries
    @countries = Country.all.select(:name, :countryCode)
    @country = Country.find_by(countryCode: params[:countryCode])
  end # Populates the nav country dropdown.
end
