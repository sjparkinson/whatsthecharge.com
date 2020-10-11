class Network < ApplicationRecord
  validates :name, presence: true
  validates :slug, format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/ }, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true

  belongs_to :country
  has_many :membership_plans
  has_many :payg_plans

  # Override Model#to_param to use :slug rather than :id for referencing a network.
  def to_param
    slug
  end
end
