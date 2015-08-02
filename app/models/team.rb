class Team < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, after_add: :set_admin
  has_many :ideas

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-z0-9_-]+\z/ }

  def admin_users
    self.memberships.admin.map(&:user)
  end

  def remove_member(user)
    self.memberships.find_by(user: user).destroy
  end


  def has_admin?(user)
    self.admin_users.include?(user)
  end
end
