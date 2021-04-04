json.extract! secure_user, :id, :login, :password_digest, :bio, :created_at, :updated_at
json.url secure_user_url(secure_user, format: :json)
