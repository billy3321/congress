json.array!(@videos) do |video|
  json.extract! video, :id, :title, :description, :url
  json.url admin_video_url(video, format: :json)
end
