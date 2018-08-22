class RenameColumnReservePeoplePeple < ActiveRecord::Migration
  def change
    rename_column :reserve_people, :pepole, :people
  end
end
