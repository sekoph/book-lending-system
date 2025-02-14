class AddColumnNameToBorrows < ActiveRecord::Migration[8.0]
  def change
    add_column :borrows, :returned_at, :datetime
  end
end
