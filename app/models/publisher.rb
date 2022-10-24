class Publisher < ApplicationRecord
  has_many :pictures, dependent: :destroy

  has_many :publisher_categories, dependent: :destroy
  has_many :categories, through: :publisher_categories

  validates :name, presence: true
  validates :description, presence: true
end
