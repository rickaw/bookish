class BookIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    matched_books = Book.all.index{|book| book.id == record.book_id}
    if matched_books == nil
      record.errors.add attribute, (options[:message] || "the book with the specified ID does not exist")
    end
  end
end

class Copy < ApplicationRecord
  validates :borrower, presence: true
  validates :dueDate, presence: true
  validates :book_id, book_id: true
end