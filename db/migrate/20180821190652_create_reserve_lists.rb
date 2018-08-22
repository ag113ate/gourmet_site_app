class CreateReserveLists < ActiveRecord::Migration
  def change
    create_table :reserve_lists do |t|
      t.date :date
      t.time :time
      t.string :name
      t.string :phone
      t.integer :people

      t.timestamps
    end
  end
end
