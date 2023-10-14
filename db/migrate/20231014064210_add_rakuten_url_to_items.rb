class AddRakutenUrlToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :rakuten_url, :string
    add_column :items, :rakuten_name, :string
    add_column :items, :rakuten_code, :string
    add_column :items, :rakuten_introduction, :text
    add_column :items, :rakuten_image, :string
  end
end
