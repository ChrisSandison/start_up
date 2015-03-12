class DashboardController < ApplicationController

  def index
    @ideas = Idea.all
  end
end
