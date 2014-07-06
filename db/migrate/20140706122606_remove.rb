class Remove < ActiveRecord::Migration
  def change
  	remove_column :locations, :district, :string
  end
end
