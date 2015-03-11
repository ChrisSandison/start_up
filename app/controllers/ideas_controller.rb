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
end
