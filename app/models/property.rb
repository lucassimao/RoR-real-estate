class Property < ApplicationRecord
    validates :description, presence: true
    validates :title, presence: true

    validates :landlord, presence: true
    validates :length, numericality: {greater_than: 0}
    validates :width, numericality: {greater_than: 0}
    validates :price, numericality: {greater_than: 0}
    belongs_to :landlord
    has_many :images
    has_one :address, as: :addressable
    enum property_type: {
        "House" => 0,
        "Apartment" => 1,
        "Land" => 2,
        "Farm" => 3
    }
    enum offer_type: {
        "Sell" => 0,
        "Rent" => 1
    }    
    validates :property_type, inclusion: property_types.keys
    validates :offer_type, inclusion: offer_types.keys


    def add_images(image)
        self.images << image
    end

    def total_area
        return self.length*self.width
    end

end
