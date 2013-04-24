class CreatePostsCategories < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :price
      t.string :location
      t.string :email 
      t.text :description
      t.integer :category_id
    end

    create_table :categories do |t|
      t.string :title
    end
  end
end
