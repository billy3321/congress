class CreateLegislatorsVideos < ActiveRecord::Migration
  def change
    create_table :legislators_videos do |t|
      t.integer :legislator_id
      t.integer :video_id
    end
  end
end
