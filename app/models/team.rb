class Team < ActiveRecord::Base
  has_many :users, through: :memberships
  has_many :ideas
end
