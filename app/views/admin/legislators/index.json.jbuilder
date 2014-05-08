json.array!(@admin_legislators) do |admin_legislator|
  json.extract! admin_legislator, :id, :name, :party_id, :description, :constituency
  json.url admin_legislator_url(admin_legislator, format: :json)
end
