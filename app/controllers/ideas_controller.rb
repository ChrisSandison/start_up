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
    @filters = params[:filters]
    @idea = Idea.find_by_id(params[:id])
    redirect_to dashboard_path(not_found: true) if @idea.blank?
  end

  def edit
    @idea = current_user.ideas.find_by_id(params[:id])
    redirect_to dashboard_path(not_found: true) if @idea.blank?

    @industries = Industry.all

    @filters = params[:filters]

    @edit_idea_form = ::EditIdeaForm.new(user: current_user, industries: @industries, idea: @idea)
  end

  def update
    @idea = current_user.ideas.find_by_id(params[:id])
    redirect_to dashboard_path(not_found: true) if @idea.blank?

    @industries = Industry.all

    @filters = params[:filters]

    @edit_idea_form = ::EditIdeaForm.new(user: current_user, industries: @industries, idea: @idea)
    @edit_idea_form.submit(params)
    redirect_to dashboard_path(updated: @idea.id, filters: @filters)
  end

  def destroy
    @idea = current_user.ideas.find_by_id(params[:id])
    redirect_to dashboard_path(not_found: true) if @idea.blank?
    title = @idea.title
    @idea.destroy
    redirect_to dashboard_path(destroyed: title)
  end
end
