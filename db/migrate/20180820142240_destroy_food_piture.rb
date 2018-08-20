class DestroyFoodPiture < ActiveRecord::Migration
  def change
    drop_table :food_pitures
  end
end
