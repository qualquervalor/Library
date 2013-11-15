class Library
  def initialize
    @books = []
    @borrowed_books = {}
  end

  # def books
  #   @books
  # end

  def list_books
    count =1
    @books.each do |x| 
      puts "#{count}. #{x.display_info} (Available)"
      count+=1
    end

    @borrowed_books.each do | k, v| 
      puts "#{count}. #{v.display_info} (Checked Out)"
      count+=1
    end

  end

  # def borrowed_books
  #   @borrowed_books
  # end

  # def available_books
  #   @books
  # end

  def add_book(book)
    @books.push book
  end

  def check_out(user, book)
    #check if valid inputs
    #check if book is available
    #check user book limit
    #remove book from available
    #add book to user borrowed book
    #update library borrowed hash
  end

  def check_in(book) 
     @books.push book
     @borrowed_books.delete(book)
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
