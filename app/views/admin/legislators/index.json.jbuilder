json.array!(@legislators) do |legislator|
  json.extract! legislator, :id, :name, :party_id, :description, :constituency
  json.url admin_legislator_url(legislator, format: :json)
end
