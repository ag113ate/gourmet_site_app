class StoreWebSitesController < ApplicationController
  def display
    # 料理名、説明分の取得
    @food_menues = FoodMenu.all
    
    # 各料理に対して、画像を取得
    menu_num = @food_menues.length
    @foods_pictures = Array.new
    for loop in 0..(menu_num - 1) do
      extract_id = @food_menues[loop].id
      @foods_pictures[extract_id] = FoodPicture.where(food_menus_id: extract_id)
    end
    
    ###  ドリンク情報の取得 ###
    @drinks = Hash.new
    # アイスドリンク
    @drinks["ice"] = Drink.where(temperature: 0)
    # ホットドリンク
    @drinks["hot"] = Drink.where(temperature: 1)
  end
end
