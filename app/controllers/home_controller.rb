class HomeController < ApplicationController
  def index
    videos = Video.order(created_at: :desc).first(5)
    @main_video = videos.shift
    @sub_videos = videos
  end

  def legislators
    @legislators = Legislator.order(name: :asc).to_a
  end

  def show_legislator
    @legislator = Legislator.find(params[:id])
  end

  def show_video
  end

  def show_entry
  end
end
