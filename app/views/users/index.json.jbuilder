json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password_digest, :date_of_birth, :gender_id, :phone_number
  json.url user_url(user, format: :json)
end
