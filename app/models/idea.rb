class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :industry
  has_many :likes

  acts_as_taggable_on :tags

  def like_count
    likes.where(like: true).count
  end

  def dislike_count
    likes.where(like: false).count
  end
end
