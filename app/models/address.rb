class Address < ApplicationRecord
    validates :description, presence: true
    belongs_to :addressable, polymorphic: true
end
