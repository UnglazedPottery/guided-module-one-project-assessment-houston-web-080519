class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :password
      t.string :image_url
      t.string :about_me
    end
  end
end
