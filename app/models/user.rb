class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :requests, :dependent => :destroy
	has_many :specialties, :dependent => :destroy
	has_many :needoptins, :dependent => :destroy
	has_many :locations, :dependent => :destroy

	
end