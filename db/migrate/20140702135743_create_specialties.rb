class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
    	t.string :service_type
    end
  end
end
