class AddIndustryToIdea < ActiveRecord::Migration
  def change
    add_reference :ideas, :industry, index: true
  end
end
