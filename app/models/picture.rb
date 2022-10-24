class Picture < ApplicationRecord
  belongs_to :publisher, dependent: :destroy

  validates :description, presence: true
  validates :url, presence: true
  validates :category, presence: true
end
