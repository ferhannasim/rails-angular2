class Api::V1::BooksController < ApplicationController
  
  before_action :authenticate
  
  def index
    books=Book.where(user_id: params[:user_id])
    if books.present?
      resp_data    = books
      resp_status  = 200
      resp_message = 'Available Books'
      resp_errors  = ''
    else
      resp_data    = ''
      resp_status  = 400
      resp_message = 'Books not found'
      resp_errors  = 'error'


    end
    common_api_response(resp_data, resp_status, resp_message, resp_errors)
  end
  def create
      book=Book.create(book_params)
      if book.save!
        resp_data    = ''
        resp_status  = 200
        resp_message = ' Your Book is created'
        resp_errors  = ''
    
      else
        resp_data    = ''
        resp_status  = 400
        resp_message = 'errors'
        resp_errors  = book.errors.full_messages
    
      end
      common_api_response(resp_data, resp_status, resp_message, resp_errors)
    
  end
  def update
    book = Book.find_by_id(params[:id])
    if book.update_attributes(book_params)
      resp_data    = book
      resp_status  = 200
      resp_message = 'updated'
      resp_errors  = ''
    else
      resp_data    = ''
      resp_status  = 400
      resp_message = 'status not changed'
      resp_errors  = 'request not found'
  
    end
    common_api_response(resp_data, resp_status, resp_message, resp_errors)
    
  end
  def show
    book=Book.find_by_id(params[:id])
    if book.present?
      resp_data    = book
      resp_status  = 200
      resp_message = 'Here is your book'
      resp_errors  = ''
    else
      resp_data    = ''
      resp_status  = 400
      resp_message = 'status not changed'
      resp_errors  = 'request not found'

    end
    common_api_response(resp_data, resp_status, resp_message, resp_errors)


  end
  
  def destroy
    book=Book.find_by_id(params[:id])
    
    if book.delete
      resp_data    = ''
      resp_status  = 200
      resp_message = 'Record Deleted'
      resp_errors  = ''
    else
      resp_data    = ''
      resp_status  = 400
      resp_message = 'Book not found'
      resp_errors  = 'Book does not exist'
  
    end
    common_api_response(resp_data, resp_status, resp_message, resp_errors)


  end
  
  def book_params
    params.require(:book).permit(:user_id,:author,:book_name,:description)

  end
  
end
