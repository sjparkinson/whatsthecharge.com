class Country < ApplicationRecord
  validates :name, presence: true
  validates :countryCode, format: { with: /\A[a-z]{2}\z/, message: "must be a lowercase two letter ISO 3166-1 alpha-2 country code" }, presence: true, uniqueness: { case_sensitive: false }

  has_many :networks
end
