class Idea < ActiveRecord::Base
  has_one :user
  has_one :industry
  has_many :likes

  acts_as_taggable_on :tags

  def like_count
    likes.where(like: true).count
  end

  def dislike_count
    likes.where(like: false).count
  end
end
