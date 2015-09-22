class CreatePerson < ActiveRecord::Migration
  def up
  	create_table :people, :primary_key => :person_id do |t|
      t.string "name"
      t.string "dob"
      t.string "gender"
      t.string "zipcode"
  	end
  end

  def down
  	drop_table :people
  end
end
