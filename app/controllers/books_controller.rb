class BooksController < ApplicationController
  def index
    books = Book.all
    render json: {
      responseCode: 200,
      responseStatus: "OK",
      responseMessage: "Success",
      data: books.map do |book|
        {
          id: book.id.to_s,
          title: book.title,
          author: book.author,
          publication_date: book.publication_date,
          description: book.description
        }
      end
    }
  end

  def store
    book = Book.new(book_params)

    if book.save
      render json: {
        responseCode: 200,
        responseStatus: "OK",
        responseMessage: "Success"
      }, status: :ok
    else
      render json: {
        responseCode: 422,
        responseStatus: "Unprocessable Entity",
        responseMessage: "Book not added"
      }, status: :unprocessable_entity
    end
  end

  def show
    book = Book.find(params[:id])

    if book
      render json: {
        responseCode: 200,
        responseStatus: "OK",
        responseMessage: "Success",
        data: {
          id: book.id.to_s,
          title: book.title,
          author: book.author,
          publication_date: book.publication_date,
          description: book.description
        }
      }
    else
      render json: {
        responseCode: 404,
        responseStatus: "Not Found",
        responseMessage: "Book not found"
      }, status: :not_found
    end
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      render json: {
        responseCode: 200,
        responseStatus: "OK",
        responseMessage: "Success"
      }, status: :ok
    else
      render json: {
        responseCode: 422,
        responseStatus: "Unprocessable Entity",
        responseMessage: "Book not updated"
      }, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])

    if book.destroy
      render json: {
        responseCode: 200,
        responseStatus: "OK",
        responseMessage: "Success"
      }, status: :ok
    else
      render json: {
        responseCode: 422,
        responseStatus: "Unprocessable Entity",
        responseMessage: "Book not deleted"
      }, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.permit(:title, :author, :publication_date, :description)
  end
end
