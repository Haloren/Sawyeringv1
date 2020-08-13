class MemberChore < ApplicationRecord
  belongs_to :member
  belongs_to :chore
  has_many :comments

  def earn_points
    # logic to add points to a memeber for donig a chore
  end

end
