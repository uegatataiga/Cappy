class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name, null: false, default: ""
      t.string :star
      t.text :introduction, null: false
      t.references :genre, foreign_key: true
      t.timestamps
    end
  end
end
