class Country < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :countryCode

  validates_format_of :countryCode,
                      with: /\A[a-z]{2}\z/,
                      message:
                        'must be a lowercase two letter ISO 3166-1 alpha-2 country code'

  validates_uniqueness_of :countryCode, case_sensitive: false

  has_many :networks, dependent: :restrict_with_error
end
