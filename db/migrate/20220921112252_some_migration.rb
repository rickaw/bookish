class SomeMigration < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :ISBN

      t.timestamps
    end

    create_table :copies do |t|
      t.string :borrower
      t.date :dueDate

      t.integer :book_id
    end

    add_foreign_key :copies, :books
  end
end
