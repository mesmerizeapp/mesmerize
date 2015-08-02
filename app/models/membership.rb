class Membership < ActiveRecord::Base
  enum team_role: [:admin, :collaborator]

  belongs_to :user
  belongs_to :team

  after_create :set_admin

  private

  def set_admin
    memberships = self.team.memberships
    memberships.first.admin! if memberships.count == 1
  end
end
