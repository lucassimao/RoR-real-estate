class Landlord < ApplicationRecord
    validates :name, presence: true
    has_many :properties
    has_one :address, as: :addressable

    def add_property(property)
        self.properties << property
    end
end
