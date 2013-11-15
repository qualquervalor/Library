# Public: A Library allows Various methods useful for performing mathematical operations.
# All methods are module methods and should be called on the Math module.
#
# Examples
#
#   Math.square_root(9)
#   # => 3
class Library

  #Initialized the array of available books and 
  #borrowed_book hash with books as keys and borrowers as values
  def initialize
    @books = []
    @borrowed_books = {}
  end

  # This methods list all the books that our in the catalog.
  # It first list the available books and then the checked out books
  def list_books
    val = available_books
    borrowed_books(val)
  end

  # This list the borrowed books passing in a count to number the output
  def borrowed_books(count=1)
    @borrowed_books.each do | k, v| 
      puts "#{count}. #{k.display_info} (Checked Out to #{v.name})"
      count+=1
    end
    count
  end

  # This list the available books passing in a count to number the output
  def available_books(count=1)
    @books.each do |x| 
      puts "#{count}. #{x.display_info} (Available)"
      count+=1
    end
    count
 end

  # This adds a book to the library's catalog
  def add_book(book)
    @books.push book
  end

  # This checks out a book from library's available book and updated 
  # the library system with who checked out the book.
  def check_out(user, book)

    #check if valid inputs

    #check if book is available
    if !(@books.include? book)
      puts "Sorry, this book is not available for check out."
      return
    end

    #check user's borrowing book limit
    if !(user.borrowed_books_count<2)
      puts "#{user.name} already has the maximum number of books the library allows an individual to check out."
      return
    end

    #remove book from available
    @books.delete book

    #update user details to reflect borrowing this book
    user.borrowed_books.push book
    user.increment_book_count

    #update library borrowed hash
    @borrowed_books[book] = user
  end

  # Adds the book back to the Library available catalog
  def check_in(book) 
     @books.push book
     who = @borrowed_books.delete(book)
     who.borrowed_books.delete(book)
     who.decrement_book_count
     puts "#{who.name} has checked in #{book.name}"
  end
end

# Public: Various methods useful for performing mathematical operations.
# All methods are module methods and should be called on the Math module.
#
# Examples
#
#   Math.square_root(9)
#   # => 3
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
  def decrement_book_count
    @book_count-=1
  end
  def borrowed_books_list
    count =1
    @books.each do |x| 
      puts "#{count}. #{x.display_info}"
      count+=1
    end
  end
end

# Public: Various methods useful for performing mathematical operations.
# All methods are module methods and should be called on the Math module.
#
# Examples
#
#   Math.square_root(9)
#   # => 3
class Book
  def initialize(title, author)
    @title = title
    @author = author
  end
  def display_info
    "#{@title} by #{@author}"
  end
end
