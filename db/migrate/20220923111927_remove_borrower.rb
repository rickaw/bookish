class RemoveBorrower < ActiveRecord::Migration[7.0]
  def change
    remove_column :copies, :borrower
  end
end
