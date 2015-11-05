json.array!(@users) do |user|
  json.extract! user, :id, :username, :pedal_id
  json.url user_url(user, format: :json)
end
