class Category < ApplicationRecord
  has_many :publisher_categories, dependent: :destroy
  has_many :publishers, through: :publisher_categories

  validates :name, presence: true
  validates :description, presence: true
end
