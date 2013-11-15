# Public: A Library maintains a catalog of books that are available for 
#         Borrowers to borrow.
#
class Library

  # Public: Initialize Librarys catalog of available and borrowed books.
  #
  # books          - The array of available books.
  # borrowed_books - Hash with Book as key and Borrower as value
  def initialize
    @books = []
    @borrowed_books = {}
  end

  # Public: Prints out the catalog of books in the library with their status.
  #
  # Examples
  #
  #   list_books()
  #   1. Finnegans Wake by James Joyce (Available)
  #   2. The C Programming Language by Kernighan and Ritchie (Available)
  def list_books
    val = available_books
    borrowed_books(val)
  end

  # Public: Prints out the checked out books in the library
  #
  # count - The interger at which to start counting the listed books 
  #
  # Examples
  #
  #   borrowed_books(4)
  #   4. Nausea by Jean-Paul Sartre (Checked Out to Mike)
  #   5. The Brothers Karamazov by Fyodor Dostoesvky (Checked Out to Gilbert)
  #
  # Returns the next count index for listing addtional books
  def borrowed_books(count=1)  
    @borrowed_books.each do | k, v| 
      puts "#{count}. #{k.display_info} (Checked Out to #{v.name})"
      count+=1
    end
    count
  end

  # Public: Prints out the available books in the library
  #
  # count - The interger at which to start counting the listed books 
  #
  # Examples
  #
  #   available_books(4)
  #   4. Nausea by Jean-Paul Sartre (Available)
  #   5. The Brothers Karamazov by Fyodor Dostoesvky (Available)
  #
  # Returns the next count index for listing addtional books
  def available_books(count=1)
    @books.each do |x| 
      puts "#{count}. #{x.display_info} (Available)"
      count+=1
    end
    count
 end

  # Public: Adds a book to the lirary's catalog.
  #
  # book  - The book to be added.
  def add_book(book)
    @books.push book
  end

  # Public: This checks out a book from library's available book and updated 
  # the library system with who checked out the book.
  #
  # user - The Borrower who is trying to check out a book
  # book - The book that is being requested
  def check_out(user, book)

    #check if valid inputs

    #check if book is available
    if !(book_available?(book))
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

  # Public: Adds the book back to the Library available catalog
  #
  # book - the book to be added back to the available catalog
  def check_in(book) 
     @books.push book
     who = @borrowed_books.delete(book)
     who.borrowed_books.delete(book)
     who.decrement_book_count
     puts "#{who.name} has checked in #{book.name}"
  end

  #Public;Checks wether book is available or not
  def book_available?(book)
    (@books.include? book)
  end
end

# Public: Defines a Borrower  who maintains a list of borrowed books
#
# Examples
#
#   Borrower("bob")
class Borrower

  # Public: Initialize Borrower with name, books array and a count of number of books borrowed.
  #
  # name  - Name of the borrower
  def initialize(name)
    @name = name
    @books = []
    @book_count = 0
  end

  #Public: Getter for borrowed books
  #
  #Returns array
  def borrowed_books
    @books
  end

  #Public: Getter for name
  #
  #Returns name object
  def name
    @name
  end

  #Public: Getter for book_count
  #
  #Returns integer representing the number of books borrowed by user
  def borrowed_books_count 
    @book_count
  end

  #Public: increments book_count
  def increment_book_count
    @book_count+=1
  end

  #Public: Decrementd book_count
  def decrement_book_count
    @book_count-=1
  end

  # Public: Prints out the borrowed books of this user
  #
  # Examples
  #
  #   borrowed_books_list()
  #   1. Nausea by Jean-Paul Sartre
  #   2. The Brothers Karamazov by Fyodor Dostoesvky
  def borrowed_books_list
    count =1
    @books.each do |x| 
      puts "#{count}. #{x.display_info}"
      count+=1
    end
  end
end

# Public: Contains information about a Book, title and author
# All methods are module methods and should be called on the Math module.
#
# Examples
#
#   Book("My title","My Author")
class Book

  # Public: Initialize Book with title and author.
  #
  # title  - String with title of book
  # author - String with author of the book
  def initialize(title, author)
    @title = title
    @author = author
  end

  #Public: Display details about a book
  #
  # Return string containing book details
  def display_info
    "#{@title} by #{@author}"
  end
end
