class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Sort records by date of creation instead of primary key.
  self.implicit_order_column = :created_at

  before_validation :clear_empty_attrs

  protected

  # Convert blank values to nil, to be saved as NULL in the database
  def clear_empty_attrs
    attributes.each { |attribute, value| self[attribute] = nil if value.blank? }
  end
end
