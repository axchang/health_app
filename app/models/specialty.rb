class Specialty < ActiveRecord::Base
	belongs_to :user
	#validates_inclusion_of :specialty, in: Choices['specialty']
	# I don't know if we need this, but need to talk to TAs about it; maybe this won't work for sorting, but I'm using a .yaml file to do the pre-defined lists.
	# reference here: http://stackoverflow.com/questions/6536527/rails-models-how-would-you-create-a-pre-defined-set-of-attributes


end