class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @industries = Industry.all
    @ideas = Idea.all

    if params[:filters].present?
    
      filters = JSON.parse(params[:filters]) if params[:filters].present?

      if filters["industry"].present? && @industries.find_by_id(filters["industry"]).present?
        @ideas = @ideas.where(industry_id: filters["industry"])
      end

      if filters["tags"].present?
        tags = JSON.parse(filters["tags"])
        @ideas = @ideas.tagged_with(tags, any: true)
      end
    end

    @filters = params[:filters]

    
  end
end
