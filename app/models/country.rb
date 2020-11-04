class Country < ApplicationRecord
  validates :name, presence: true
  validates :countryCode,
            format: {
              with: /\A[a-z]{2}\z/,
              message:
                'must be a lowercase two letter ISO 3166-1 alpha-2 country code'
            },
            uniqueness: { case_sensitive: false },
            presence: true

  has_many :networks, dependent: :restrict_with_error
end
