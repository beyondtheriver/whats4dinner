class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :f_name
      t.string :l_name
      t.integer :fav_recipe_id

      t.timestamps null: false
    end
  end
end
