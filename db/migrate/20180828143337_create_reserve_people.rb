class CreateReservePeople < ActiveRecord::Migration
  def change
    create_table :reserve_people do |t|
      t.date :date
      t.time :time
      t.integer :people

      t.timestamps
    end
  end
end
