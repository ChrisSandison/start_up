class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
