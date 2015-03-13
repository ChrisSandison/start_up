class EditIdeaForm < Form
  attr_accessor :title, :description, :industry, :tags, :tags_list, :idea

  def initialize(options = {})
    super(options)
    self.idea = options[:idea]
    self.title = self.idea.title
    self.description = self.idea.description
    self.industry = self.idea.industry_id
    self.tags_list = self.idea.tag_list
  end

  def submit(attrs)

    idea_params = attrs[:edit_idea_form]
    idea.title = idea_params[:title]
    idea.description = idea_params[:description]
    idea.industry_id = Industry.find_by_id(idea_params[:industry]).try(:id)

    idea.tag_list = idea_params[:tags].split(",")

    idea.save
  end
end