class RemoveNeedFromRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :need, :string
  end
end
