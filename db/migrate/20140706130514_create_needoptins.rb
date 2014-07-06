class CreateNeedoptins < ActiveRecord::Migration
  def change
    create_table :needoptins do |t|
    	t.integer :user_id
    	t.integer :need_id
    end
  end
end
