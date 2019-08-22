class CreateRecipes < ActiveRecord::Migration[5.2]
    def change
      create_table :recipes do |t|
        t.string :name
        t.string :cook_time
        t.string :image_url
        t.string :ingredients
        t.string :directions
        t.integer :user_id
        t.integer :cookbook_id
      end
    end
   end