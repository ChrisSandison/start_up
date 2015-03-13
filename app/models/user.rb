class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :likes

  def has_liked?(idea)
    idea.likes.where(user_id: self.id, like: true).present?
  end

  def has_disliked?(idea)
    idea.likes.where(user_id: self.id, like: false).present?
  end

  def has_created?(obj)
    obj.user_id == self.id
  end
end
