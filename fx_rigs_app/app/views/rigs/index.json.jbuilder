json.array!(@rigs) do |rig|
  json.extract! rig, :id, :guitarist, :rig_photo, :description, :comments, :user_id, :pedal_id, :genre_id
  json.url rig_url(rig, format: :json)
end
