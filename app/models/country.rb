class Country < ApplicationRecord
  validates :name, presence: true
  validates :countryCode, format: { with: /\A[a-z]{2}\z/ }, presence: true, uniqueness: { case_sensitive: false }

  has_many :networks
end
