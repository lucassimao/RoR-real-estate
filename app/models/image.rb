class Image < ApplicationRecord
    validates :name, presence: true
    validates :size, numericality: { greater_than: 0}
    validates :url, presence: true, format: {
        with: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/\/=]*)/,
        message: 'only http or https URLs are permited' } 
    belongs_to :property
end
