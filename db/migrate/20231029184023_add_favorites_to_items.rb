class AddFavoritesToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :favorites, :string
  end
end
