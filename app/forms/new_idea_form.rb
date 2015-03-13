class NewIdeaForm < Form

  attr_accessor :title, :description, :industry, :tags

  def initialize(options = {})
    super(options)
  end

  def submit(attrs)
    idea_params = attrs[:new_idea_form]
    idea = Idea.new
    idea.title = idea_params[:title]
    idea.description = idea_params[:description]
    idea.industry_id = Industry.find_by_id(idea_params[:industry]).try(:id)
    idea.user_id = user.id
    idea.tag_list.add(*idea_params[:tags].split(","))

    idea.save
  end

end