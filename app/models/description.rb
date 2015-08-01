class Description < ActiveRecord::Base
  belongs_to  :idea
  has_many  :comments, as: :commentable
end
