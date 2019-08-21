class CreateCookbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cookbooks do |t|
      t.string :title
      t.string :image_url
      t.integer :author_id
    end
  end
end
