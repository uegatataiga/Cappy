class AddStarToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :star, :string
  end
end
