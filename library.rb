class Library
  def initialize
    @books = []
    @borrowed_books = {}
  end

  # def books
  #   @books
  # end

  def list_books
 available_books
 borrowed_books

  end

  def borrowed_books
    count =1
    @borrowed_books.each do | k, v| 
      puts "#{count}. #{k.display_info} (Checked Out to #{v.name})"
      count+=1
    end
  end

  def available_books
     count =1
    @books.each do |x| 
      puts "#{count}. #{x.display_info} (Available)"
      count+=1
    end
 end

  def add_book(book)
    @books.push book
  end

  def check_out(user, book)

    #check if valid inputs
    #check if book is available
    if !(@books.include? book)
      puts "This book is not available for check out."
      return
    end

puts "#{user.name} has #{user.borrowed_books_count}"
    #check user book limit
    if !(user.borrowed_books_count<2)
      puts "You already have the maxium number of books the library allows you to check out."
      return
    end

    #remove book from available
    @books.delete book

    #add book to user borrowed book
    user.borrowed_books.push book
    user.increment_book_count

    #update library borrowed hash
    @borrowed_books[book] = user
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
  def increment_book_count
    @book_count+=1
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
