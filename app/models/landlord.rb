class Landlord < ApplicationRecord
    validates :name, presence: true
    has_many :properties
end
