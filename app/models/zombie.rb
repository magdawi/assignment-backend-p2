class Zombie < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :day_of_death
	validates :name, :length => {:minimum => 1}
end
