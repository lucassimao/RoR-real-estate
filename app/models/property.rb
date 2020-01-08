class Property < ApplicationRecord
    validates :description, presence: true
    validates :landlord, presence: true
    validates :length, numericality: {greater_than: 0}
    validates :width, numericality: {greater_than: 0}
    validates :price, numericality: {greater_than: 0}
    belongs_to :landlord
    has_many :images

    def add_images(image)
        self.images << image
    end

    def total_area
        return self.length*self.width
    end

end
