json.extract! image, :id, :description, :name, :type, :size, :path, :created_at, :updated_at
json.url image_url(image, format: :json)
