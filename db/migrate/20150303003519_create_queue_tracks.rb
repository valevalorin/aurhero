class CreateQueueTracks < ActiveRecord::Migration
  def change
    create_table :queue_tracks do |t|
      t.string :link
      t.string :title
      t.string :artist
      t.string :album

      t.timestamps
    end
  end
end
