class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :idea
      t.boolean :like, default: true
      t.timestamps
    end
  end
end
