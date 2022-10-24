class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description

      t.belongs_to :publisher, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
