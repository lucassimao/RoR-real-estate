class Property < ApplicationRecord
    validates :description, presence: true
    validates :landlord, presence: true
    validates :total_area, numericality: {greater_than: 0}
    validates :price, numericality: {greater_than: 0}
    belongs_to :landlord
    has_many :images

    def add_images(image)
        self.images << image
    end

end
