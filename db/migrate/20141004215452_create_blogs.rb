class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :subdomain
      t.string :template_color
      t.references :user, index: true

      t.timestamps
    end
  end
end
