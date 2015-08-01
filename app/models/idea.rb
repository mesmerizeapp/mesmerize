class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voters, source: :user, through: :votes, dependent: :destroy
  has_one :description, dependent: :destroy

  after_create :create_description
end
