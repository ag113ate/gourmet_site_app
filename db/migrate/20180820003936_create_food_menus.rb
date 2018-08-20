class CreateFoodMenus < ActiveRecord::Migration
  def change
    create_table :food_menus do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
