class AddNeedToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :need, :string
  end
end
