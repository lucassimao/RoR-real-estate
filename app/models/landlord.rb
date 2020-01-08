class Landlord < ApplicationRecord
    validates :name, presence: true
    has_many :properties

    def add_property(property)
        self.properties << property
    end
end
