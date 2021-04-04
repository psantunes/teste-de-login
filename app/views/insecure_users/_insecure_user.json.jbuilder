json.extract! insecure_user, :id, :login, :password, :bio, :created_at, :updated_at
json.url insecure_user_url(insecure_user, format: :json)
