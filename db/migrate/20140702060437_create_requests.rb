class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.text :description
    	t.string :status

    	t.timestamps
    end
  end
end
