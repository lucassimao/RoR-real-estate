class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :description
      t.string :name
      t.string :type
      t.string :size
      t.string :url
      t.references :property, foreign_key: true
      t.timestamps
    end
  end
end
