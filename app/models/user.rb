class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :requests
	has_many :specialties

	# MPC - this is related to yml method of adding list, but is causing errors
	# validates_inclusion_of :specialty, in: Choices['specialty']
	# validates_inclusion_of :location, in: Choices['location']

	
end