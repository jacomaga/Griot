class Publisher < ApplicationRecord
  has_many :pictures, dependent: :destroy

  has_many :publisher_categories, dependent: :destroy
  has_many :categories, through: :publisher_categories

  validates :name, presence: true
  validates :description, presence: true

  scope :recent, lambda { |_order|
    publisher == 'true' ? publisher(created_at: :desc) : publisher(created_at: :asc)
  }

  def self.search(params = {})
    publishers = if params[:publisher_ids].present?
                   Publisher.find(params[:publisher_ids])
                 else
                   Publisher.all
                 end
    publishers = publishers.recent(params[:recent]) if params[:recent].present?

    publishers
  end
end
