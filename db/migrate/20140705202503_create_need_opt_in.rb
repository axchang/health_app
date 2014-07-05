class CreateNeedOptIn < ActiveRecord::Migration
  def change
    create_table :need_opt_ins do |t|
    	t.integer :user_id
    	t.integer :need_id
    end
  end
end
