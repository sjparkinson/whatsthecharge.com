class Network < ApplicationRecord
  include NormalizeBlankValues

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :slug
  validates_presence_of :website_url
  validates_presence_of :country

  validates_uniqueness_of :slug, scope: :country
  validates_uniqueness_of :android_app_url, allow_nil: true
  validates_uniqueness_of :ios_app_url, allow_nil: true

  validates_format_of :slug, with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "must be a lowercase alpha-numeric value, which can include hyphens"
  validates_format_of :android_app_url, with: /\Ahttps:\/\/play\.google\.com\/store\/apps\/details\?id=[^&]+\z/, message: "must be a valid Google Play App URL", allow_nil: true
  validates_format_of :ios_app_url, with: /\Ahttps:\/\/apps\.apple\.com\/gb\/app\/[^\/]+\/id\d+\z/, message: "must be a valid App Store App URL", allow_nil: true

  belongs_to :country
  has_many :membership_plans
  has_many :payg_plans
end
