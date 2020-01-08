class CreateLandlords < ActiveRecord::Migration[5.2]
  def change
    create_table :landlords do |t|
      t.string :name
      t.date :birth_date

      t.timestamps
    end
  end
end
