class AddDurationToQueueLogs < ActiveRecord::Migration
  def change
    add_column :queue_logs, :duration, :int
  end
end
