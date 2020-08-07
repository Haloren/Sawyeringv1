class Member < ApplicationRecord
	# belong_to :household

	has_many :chores
	has_many :member_chores
	has_many :chores, through: :member_chores, source: :chore
	
end
