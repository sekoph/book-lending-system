class RenameOldColumnNameToNewColumnNameInBorrows < ActiveRecord::Migration[8.0]
  def change
    rename_column :borrows, :returned_at, :due_date
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
