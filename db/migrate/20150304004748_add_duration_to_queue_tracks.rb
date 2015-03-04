class AddDurationToQueueTracks < ActiveRecord::Migration
  def change
    add_column :queue_tracks, :duration, :int
  end
end
