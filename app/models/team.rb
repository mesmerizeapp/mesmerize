class Team < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, after_add: :set_admin
  has_many :ideas

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-z0-9_-]+\z/ }
end
