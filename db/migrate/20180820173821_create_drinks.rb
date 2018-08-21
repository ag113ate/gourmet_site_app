class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :temperature
      t.string :name

      t.timestamps
    end
  end
end
