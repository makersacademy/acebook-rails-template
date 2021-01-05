json.extract! comment_like, :id, :user_id, :commontator_comments_id, :created_at, :updated_at
json.url comment_like_url(comment_like, format: :json)
