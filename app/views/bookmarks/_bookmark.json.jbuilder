json.extract! bookmark, :id, :user_id, :location, :comment, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)