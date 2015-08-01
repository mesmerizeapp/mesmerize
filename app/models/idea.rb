class Idea < ActiveRecord::Base
  belongs_to :user
  has_many  :comments, as: :commentable
  has_one :description

  after_create :create_description
end
