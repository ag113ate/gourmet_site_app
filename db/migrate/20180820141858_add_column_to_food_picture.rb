class AddColumnToFoodPicture < ActiveRecord::Migration
  def change
    add_column :food_pictures, :pict_url, :string
    add_column :food_pictures, :pict_alt, :string
  end
end
