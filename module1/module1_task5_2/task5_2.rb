class Book
  attr_accessor :id, :title, :authors, :publisher, :publication_year, :page_count, :price, :binding_type

  def initialize(id, title, authors, publisher, publication_year, page_count, price, binding_type)
    @id = id
    @title = title
    @authors = authors
    @publisher = publisher
    @publication_year = publication_year
    @page_count = page_count
    @price = price
    @binding_type = binding_type
  end
end

class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def books_by_author(author_name)
    @books.select { |book| book.authors.include?(author_name) }
  end

  def books_by_publisher(publisher_name)
    @books.select { |book| book.publisher == publisher_name }
  end

  def books_published_after(year)
    @books.select { |book| book.publication_year > year }
  end

  def list_books(books)
    books.each do |book|
      puts "ID: #{book.id}"
      puts "Title: #{book.title}"
      puts "Authors: #{book.authors.join(', ')}"
      puts "Publisher: #{book.publisher}"
      puts "Publication Year: #{book.publication_year}"
      puts "Page Count: #{book.page_count}"
      puts "Price: #{book.price}"
      puts "Binding Type: #{book.binding_type}"
      puts "-----------------------------"
    end
  end
end

# Створення книг та бібліотеки
book1 = Book.new(1, 'Book 1', ['Author A'], 'Publisher X', 2020, 300, 20.0, 'Hardcover')
book2 = Book.new(2, 'Book 2', ['Author B', 'Author C'], 'Publisher Y', 2022, 250, 15.0, 'Paperback')
book3 = Book.new(3, 'Book 3', ['Author A', 'Author D'], 'Publisher Z', 2018, 400, 25.0, 'Hardcover')

library = Library.new
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)


puts "Books by Author A:"
author_books = library.books_by_author('Author A')
library.list_books(author_books)


puts "Books by Publisher X:"
publisher_books = library.books_by_publisher('Publisher X')
library.list_books(publisher_books)


puts "Books published after 2019:"
recent_books = library.books_published_after(2019)
library.list_books(recent_books)