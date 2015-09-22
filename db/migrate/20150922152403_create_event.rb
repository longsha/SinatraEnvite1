class CreateEvent < ActiveRecord::Migration
  def up
  	create_table :events, :primary_key => :event_id do |t|
      t.string "name"
      t.string "date"
  	end
  end

  def down
  	drop_table :events
  end
end
