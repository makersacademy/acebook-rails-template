json.extract! post, :id, :postBody, :created_at, :updated_at
json.url post_url(post, format: :json)
