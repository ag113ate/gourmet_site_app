class StoreWebSitesController < ApplicationController
  def display
    @food_menues = FoodMenu.all
  end
end
