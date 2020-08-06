class MemberChore < ApplicationRecord
  belongs_to :members
  belongs_to :chores
  has_many :comments
end
