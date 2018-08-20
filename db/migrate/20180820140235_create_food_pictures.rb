class CreateFoodPictures < ActiveRecord::Migration
  def change
    create_table :food_pictures do |t|
      t.string :food_menus_id

      t.timestamps
    end
  end
end
