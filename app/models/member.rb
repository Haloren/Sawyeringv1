class Member < ApplicationRecord
	# belong_to :household

	validates :name, presence: true, uniqueness: true

	# created members are unique
	has_many :created_chores, foreign_key: "member_id", class_name: "Chore"
	
	# completed_chores can be repeated
	has_many :member_chores
	has_many :completed_chores, through: :member_chores, source: :chore
	
end
