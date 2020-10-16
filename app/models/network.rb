class Network < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :slug, format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "must be a lowercase value matching [a-z0-9]+(?:-[a-z0-9]+)*" }, presence: true, uniqueness: { case_sensitive: false }
  validates :website_url, presence: true
  validates :country, presence: true

  belongs_to :country
  has_many :membership_plans
  has_many :payg_plans
end
