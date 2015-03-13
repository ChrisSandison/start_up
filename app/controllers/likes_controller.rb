class LikesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :lookup_like

  def new_like
    if @like.blank?
      # create it
      @like = Like.create(
        user: current_user,
        idea: @idea,
        like: true
        )
    elsif @like.disliked?
      @like.update(like: true)
    end
    render json: {idea_id: @idea.id, liked: true, idea_likes: @idea.like_count, idea_dislikes: @idea.dislike_count}
  end

  def new_dislike
    if @like.blank?
      @like = Like.create(
        user: current_user,
        idea: @idea,
        like: false
        )
    elsif @like.liked?
      @like.update(like: false)
    end
    render json: {idea_id: @idea.id, liked: false, idea_likes: @idea.like_count, idea_dislikes: @idea.dislike_count}
  end

  def lookup_like
    @idea = Idea.find_by_id(params[:idea_id])
    @like = @idea.likes.where(user_id: current_user.id).first
  end
end
