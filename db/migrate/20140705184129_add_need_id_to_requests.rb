class AddNeedIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :need_id, :integer
  end
end
