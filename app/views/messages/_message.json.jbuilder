json.extract! message, :id, :body, :created_at, :updated_at
json_url message_url(message, format: :json)
