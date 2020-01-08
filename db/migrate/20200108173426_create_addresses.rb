class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :city
      t.string :country
      t.string :zip
      t.decimal :lat, scale: 6, precision: 10
      t.decimal :long, scale: 6, precision: 10
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
