json.array!(@parties) do |party|
  json.extract! party, :id, :name, :image
  json.url admin_party_url(party, format: :json)
end
