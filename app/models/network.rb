class Network < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :slug, format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "must be a lowercase value matching [a-z0-9]+(?:-[a-z0-9]+)*" }, presence: true, uniqueness: { scope: :country, case_sensitive: false }
  validates :website_url, presence: true
  validates :country, presence: true

  # Mobile app columns
  validates :android_app_id, format: { with: /\A[a-z][a-z0-9_]*(\.[a-z0-9_]+)+[0-9a-z_]\z/, message: "must be a valid Android application ID" }, uniqueness: { case_sensitive: false }
  validates :ios_app_id, format: { with: /\A[a-z][a-z0-9_]*(\.[a-z0-9_]+)+[0-9a-z_]\z/, message: "must be a valid iOS app ID" }, uniqueness: { case_sensitive: false }

  belongs_to :country
  has_many :membership_plans
  has_many :payg_plans
end
