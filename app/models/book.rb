class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :ISBN, presence: true

  has_many :copies

  def self.search(search)
    if search
      Book.select{|b| b.title.downcase.include? search.downcase or b.author.downcase.include? search.downcase}
    else
      Book.all
    end
  end
end
