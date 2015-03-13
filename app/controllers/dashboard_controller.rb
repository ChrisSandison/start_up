class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @industries = Industry.all
    @ideas = Idea.all
    @destroyed = params[:destroyed]

    if params[:filters].present?
    
      filters = JSON.parse(params[:filters]) if params[:filters].present?

      if filters["industry"].present? && @industries.find_by_id(filters["industry"]).present?
        @ideas = @ideas.where(industry_id: filters["industry"])
      end

      if filters["tags"].present? 
        tags = JSON.parse(filters["tags"])
        if tags.present?
          @ideas = @ideas.tagged_with(tags, any: true)
        end
      end

      if filters["created_by"].present?
        filter = filters["created_by"]
        if filter == "not me"
          @ideas = @ideas.where("user_id != ?", current_user.id)
        elsif filter == "me"
          @ideas = @ideas.where("user_id = ?", current_user.id)
        end
      end

      if filters["sorted_by"].present?
        case filters["sorted_by"]
        when "name desc"
          @ideas = @ideas.order(:title)
        when "name asc"
          @ideas = @ideas.order("title DESC")
        when "newest"
          @ideas = @ideas.order("created_at DESC")
        when "oldest"
          @ideas = @ideas.order("created_at ASC")
        else
          @ideas = @ideas
        end
      end

    end

    @filters = params[:filters]
    
  end
end
