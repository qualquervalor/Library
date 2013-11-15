class Library
  def initialize
    @books = []
  end

  def books
  end

  def list_books
    count =1
    @books.each do |x| 
      puts "#{count}. #{x.display_info}"
      count+=1
    end
  end

  def borrowed_books
  end

  def available_books
  end

  def add_book(book)
    @books.push book
  end

  def check_out(user, book)
  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
    @name = name
    @books = []
    @book_count = 0
  end

  def borrowed_books
    @books
  end

  def name
    @name
  end

  def borrowed_books_count 
    @book_count
  end

  def borrowed_books_list
    count =1
    @books.each do |x| 
      puts "#{count}. #{x.display_info}"
      count+=1
    end
  end
end

class Book
  def initialize(title, author)
    @title = title
    @author = author
  end
  def display_info
    "#{@title} by #{@author}"
  end
end
