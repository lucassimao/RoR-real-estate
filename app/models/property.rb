class Property < ApplicationRecord
    # Validation 

    validates :description, presence: true
    validates :title, presence: true
    validates :landlord, presence: true
    validates :length, numericality: {greater_than: 0}
    validates :width, numericality: {greater_than: 0}
    validates :price, numericality: {greater_than: 0}
    belongs_to :landlord, class_name: 'User', foreign_key: 'user_id'
    has_many :images
    has_one :address, as: :addressable
    accepts_nested_attributes_for :address

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

    # Scopes

    scope :get_all, -> (city,country) do
        filter = build_filter(nil, city, country)
        includes(:address).where(filter).order('properties.created_at desc').limit(20)
    end

    scope :sale_offers, ->  (city,country) do
        filter = build_filter(:Sell, city, country)
        includes(:address).where(filter).order('properties.created_at desc').limit(20)
    end

    scope :renting_offers, -> (city,country) do
        filter = build_filter(:Rent, city, country)
        includes(:address).where(filter).order('properties.created_at desc').limit(20)        
    end

    def add_images(image)
        self.images << image
    end

    def total_area
        return self.length*self.width
    end

    private

    def self.build_filter(offer_type,city,country)
        filter = {}
        if offer_type 
            filter['offer_type'] = offer_type
        end
        if city
            filter['addresses.city'] = city
        end
        if country
            filter['addresses.country'] = country
        end
        return filter
    end

end
