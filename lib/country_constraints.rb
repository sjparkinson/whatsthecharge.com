class CountryConstraints
  def matches?(request)
    Country.exists?(countryCode: request.params[:countryCode])
  end
end
