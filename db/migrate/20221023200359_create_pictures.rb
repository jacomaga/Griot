class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.text :description
      t.string :url
      t.string :category

      t.belongs_to :publisher, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
