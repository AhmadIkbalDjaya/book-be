class BooksController < ApplicationController
  def index
    books = Book.all
    json_data = {
      responseCode: 200,
      responseStatus: "OK",
      responseMessage: "Success",
      data: books.map do |book|
        {
          id: book.id,
          title: book.title,
          author: book.author
        }
      end
    }
    render json: json_data
  end

  def store
    book = Book.new(title: params[:title], author: params[:author])

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
      json_data = {
        responseCode: 200,
        responseStatus: "OK",
        responseMessage: "Success",
        data: {
          id: book.id,
          title: book.title,
          author: book.author
        }
      }
      render json: json_data
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

    if book.update(title: params[:title], author: params[:author])
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
end
