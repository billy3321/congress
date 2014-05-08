json.array!(@admin_parties) do |admin_party|
  json.extract! admin_party, :id, :name, :image
  json.url admin_party_url(admin_party, format: :json)
end
