class CreatePublisherCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :publisher_categories do |t|
      t.belongs_to :publisher, index: { unique: true }, foreign_key: true, null: false
      t.belongs_to :category, index: { unique: true }, foreign_key: true, null: false

      t.timestamps
    end
  end
end
