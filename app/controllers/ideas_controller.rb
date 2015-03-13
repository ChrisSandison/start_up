class IdeasController < ApplicationController

  before_filter :authenticate_user!

  def new
    @industries = Industry.all
    @new_idea_form = ::NewIdeaForm.new(user: current_user, industries: @industries)
  end

  def create
    @industries = Industry.all
    @new_idea_form = ::NewIdeaForm.new(user: current_user, industries: @industries)
    @new_idea_form.submit(params)

    redirect_to dashboard_path
  end

  def show

  end

  def edit

  end

  def destroy
    @idea = current_user.ideas.find_by_id(params[:id])
    redirect_to dashboard_path(not_found: true) if @idea.blank?
    title = @idea.title
    @idea.destroy
    redirect_to dashboard_path(destroyed: title)
  end
end
