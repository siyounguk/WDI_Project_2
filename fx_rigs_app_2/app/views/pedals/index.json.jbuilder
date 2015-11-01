json.array!(@pedals) do |pedal|
  json.extract! pedal, :id, :name, :type, :pedal_photo, :price_paid, :review, :rig_id, :user_id
  json.url pedal_url(pedal, format: :json)
end
