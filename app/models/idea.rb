class Idea < ActiveRecord::Base
  has_one :user
  has_one :industry

  acts_as_taggable_on :tags
end
