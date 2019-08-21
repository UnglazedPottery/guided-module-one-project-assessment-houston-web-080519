class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :author_id
      t.integer :cookbook_id
      t.integer :cook_time
      t.string :image_url
      t.string :ingredients
      t.string :directions
    end
  end
end
