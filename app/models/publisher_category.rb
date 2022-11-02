class PublisherCategory < ApplicationRecord
  belongs_to :publisher
  belongs_to :category, inverse_of: :publisher_categories

  validates_associated :publisher
  validates_associated :category
end
