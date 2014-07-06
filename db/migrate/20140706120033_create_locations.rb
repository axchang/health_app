class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :district
    	t.string :local_muni
    end
  end
end
