class Video < ActiveRecord::Base
  has_and_belongs_to_many :legislators

  before_save do |video|
    begin
      youtube_id = extract_youtube_id(video.url)
      #"https://www.youtube.com/watch?v=oeRo-ydS0UE"
      #"http://youtu.be/oeRo-ydS0UE"
      video.url = "https://www.youtube.com/?v=" + youtube_id
      response = HTTPClient.get('https://www.googleapis.com/youtube/v3/videos?part=snippet&id=' + youtube_id + '&key=' + API_CONFIG['google_public_key']['api_key'])
      result = JSON.parse(response.body)
      video.image = result['items'][0]['snippet']['thumbnails']['maxres']['url']
      if video.title.blank?
        video.title = result['items'][0]['snippet']['title']
      end
      if video.description.blank?
        video.description = result['items'][0]['snippet']['description']
      end
    # rescue => err
    #   puts ">>>>>>", err.inspect
    #   video.image = nil
    end
  end

  def extract_youtube_id(url)
    youtube_uri = URI.parse(url)
    if youtube_uri.host == 'www.youtube.com'
      params = youtube_uri.query
      youtube_id = CGI::parse(params)['v'].first
    elsif youtube_uri.host == 'youtu.be'
      youtube_id = youtube_uri.path[1..-1]
    else
      raise 'youtube id not found'
    end
  end
end
