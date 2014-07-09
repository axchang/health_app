class AddFulfillerToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :fulfiller, :string
  end
end
