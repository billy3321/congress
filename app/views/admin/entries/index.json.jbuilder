json.array!(@entries) do |entry|
  json.extract! entry, :id, :title, :category_id, :description, :url
  json.url admin_entry_url(entry, format: :json)
end
