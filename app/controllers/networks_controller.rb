class NetworksController < ApplicationController
  def index
    country = Country.select(:id).find_by(countryCode: params[:countryCode])

    @networks =
      Network.where(country: country).select(
        :name,
        :description,
        :slug,
        :website_url
      )

    fresh_when @networks
  end
end
