class Need < ActiveRecord::Base
	has_many :requests
	has_many :needoptins
	has_many :users, through: :needoptins
end