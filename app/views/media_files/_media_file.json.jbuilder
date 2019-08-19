json.extract! media_file, :id, :description, :user_id, :created_at, :updated_at
json.url media_file_url(media_file, format: :json)
