class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.string :image_id
      t.text :body
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
