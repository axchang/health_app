class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :org_name
    	t.string :location
    	t.string :specialty
    	  	
    	t.timestamps
    end
  end
end
