json.array!(@admin_entries) do |admin_entry|
  json.extract! admin_entry, :id, :title, :category_id, :description, :url
  json.url admin_entry_url(admin_entry, format: :json)
end
