json.extract! timeline_post, :id, :content, :poster, :posted, :created_at, :updated_at
json.url timeline_post_url(timeline_post, format: :json)
