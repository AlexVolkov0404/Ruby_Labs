require 'rspec'
require_relative 'task5_2.rb'
RSpec.describe Library do
  before(:each) do
    @library = Library.new
    @book1 = Book.new(1, 'Book 1', ['Author A'], 'Publisher X', 2020, 300, 20.0, 'Hardcover')
    @book2 = Book.new(2, 'Book 2', ['Author B', 'Author C'], 'Publisher Y', 2022, 250, 15.0, 'Paperback')
    @book3 = Book.new(3, 'Book 3', ['Author A', 'Author D'], 'Publisher Z', 2018, 400, 25.0, 'Hardcover')
    @library.add_book(@book1)
    @library.add_book(@book2)
    @library.add_book(@book3)
  end

  it 'should return a list of books by a specific author' do
    expect(@library.books_by_author('Author A')).to eq([@book1, @book3])
    expect(@library.books_by_author('Author B')).to eq([@book2])
  end

  it 'should return a list of books by a specific publisher' do
    expect(@library.books_by_publisher('Publisher X')).to eq([@book1])
    expect(@library.books_by_publisher('Publisher Y')).to eq([@book2])
  end

  it 'should return a list of books published after a specific year' do
    expect(@library.books_published_after(2021)).to eq([@book2])
    expect(@library.books_published_after(2019)).to eq([@book1, @book2])
  end
end