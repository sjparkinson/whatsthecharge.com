class ApplicationController < ActionController::Base
  # Set default paramters to include in all url helper methods.
  def default_url_options
    { country: "uk" }
  end
end
