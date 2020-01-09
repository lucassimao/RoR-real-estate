class AddOfferTypeToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :offer_type, :integer
  end
end
