class CountryConstraints
  def matches?(request)
    # Using find_by here, rather than exists?, as the same query is
    # then cachable in application_controller.rb
    Country.find_by(countryCode: request.params[:countryCode]).present?
  end
end
