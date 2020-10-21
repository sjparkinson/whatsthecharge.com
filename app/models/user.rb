class User < ApplicationRecord
  validates_presence_of :email

  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_uniqueness_of :email, case_sensitive: false

  before_save { email.downcase! }

  has_secure_password
end
