class CreateRegistration < ActiveRecord::Migration
  def up
  	create_table :registrations, :primary_key => :registration_id do |t|
      t.belongs_to :people, index: true
      t.belongs_to :events, index: true
      t.string "status"
  	end
  end

  def down
  	drop_table :registrations
  end
end
