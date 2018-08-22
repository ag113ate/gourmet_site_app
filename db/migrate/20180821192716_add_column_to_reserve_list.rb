class AddColumnToReserveList < ActiveRecord::Migration
  def change
    add_column :reserve_lists, :reserved, :booblean
  end
end
