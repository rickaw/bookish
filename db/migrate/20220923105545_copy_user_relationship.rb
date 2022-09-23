class CopyUserRelationship < ActiveRecord::Migration[7.0]
  def change
    add_reference :copies, :user
    add_foreign_key :copies, :users

  end
end