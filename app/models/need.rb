class Need < ActiveRecord::Base
	has_many :requests
	has_many :needoptins
end