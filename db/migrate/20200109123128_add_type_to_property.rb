class AddTypeToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :property_type, :integer
  end
end
