class Network < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :slug,
            presence: true,
            format: {
              with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/,
              message:
                'must be a lowercase alpha-numeric value, which can include hyphens'
            },
            uniqueness: { scope: :country }
  validates :website_url, presence: true
  validates :android_app_url,
            format: {
              with: %r{\Ahttps:\/\/play\.google\.com\/store\/apps\/details\?id=[^&]+\z},
              message: 'must be a valid Google Play App URL',
              allow_nil: true
            },
            uniqueness: { allow_nil: true }
  validates :ios_app_url,
            format: {
              with: %r{\Ahttps:\/\/apps\.apple\.com\/[^/]+\/app\/[^/]+\/id\d+\z},
              message: 'must be a valid App Store App URL',
              allow_nil: true
            },
            uniqueness: { allow_nil: true }
  validates :country, presence: true

  belongs_to :country
  has_many :membership_plans, dependent: :destroy
  has_many :payg_plans, dependent: :destroy
end
