class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  def liked?
    self.like?
  end

  def disliked?
    !liked?
  end
end
