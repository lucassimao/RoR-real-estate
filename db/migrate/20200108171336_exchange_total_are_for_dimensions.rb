class ExchangeTotalAreForDimensions < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :width, :decimal, { default: 0,  scale: 2, precision: 6}
    add_column :properties, :length, :decimal, { default: 0,  scale: 2, precision: 6}
  end
end
