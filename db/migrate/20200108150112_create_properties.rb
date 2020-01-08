class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :description
      t.decimal :total_area, scale: 2, precision: 6
      t.decimal :price, scale: 2, precision: 6
      t.references :landlord, foreign_key: true

      t.timestamps
    end
  end
end
