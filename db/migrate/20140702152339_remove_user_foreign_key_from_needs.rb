class RemoveUserForeignKeyFromNeeds < ActiveRecord::Migration
  def change
  	remove_column :needs, :user_id, :integer
  end
end
