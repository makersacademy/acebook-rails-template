json.extract! profile_picture, :id, :created_at, :updated_at
json.url profile_picture_url(profile_picture, format: :json)
