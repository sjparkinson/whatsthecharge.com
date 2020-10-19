class Network < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :slug, format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "must be a lowercase value matching [a-z0-9]+(?:-[a-z0-9]+)*" }, presence: true, uniqueness: { scope: :country, case_sensitive: false }
  validates :website_url, presence: true
  validates :country, presence: true

  validates :android_app_url, format: { with: /\Ahttps:\/\/play\.google\.com\/store\/apps\/details\?id=[^&]+\z/, message: "must be a valid Google Play App URL" }, uniqueness: true
  validates :ios_app_url, format: { with: /\Ahttps:\/\/apps\.apple\.com\/gb\/app\/[^\/]+\/id\d+\z/, message: "must be a valid App Store App URL" }, uniqueness: true

  belongs_to :country
  has_many :membership_plans
  has_many :payg_plans
end
