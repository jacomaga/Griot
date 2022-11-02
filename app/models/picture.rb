class Picture < ApplicationRecord
  belongs_to :publisher

  validates :description, presence: true
  validates :url, presence: true
  validates :category, presence: true

  scope :recent, lambda { |_order|
    picture == 'true' ? picture(created_at: :desc) : picture(created_at: :asc)
  }

  def self.search(params = {})
    pictures = if params[:picture_ids].present?
                 Picture.find(params[:picture_ids])
               else
                 Picture.all
               end
    pictures = pictures.recent(params[:recent]) if params[:recent].present?

    pictures
  end
end
