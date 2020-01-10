class ChangePropertyOwership < ActiveRecord::Migration[5.2]
  def change
    remove_reference :properties, :landlord,  foreign_key: true
    add_reference :properties, :user, foreign_key: true
  end
end
