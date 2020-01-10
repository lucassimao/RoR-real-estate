class User < ApplicationRecord
    validates :login, presence: true, uniqueness: true
    validates :name, presence: true

    has_one :address, as: :addressable
    has_many :properties

    has_secure_password

    def add_property(property)
        self.properties << property
    end
end
