class BooksController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]

    def index
        @books = Book.all
    end

    def show
        @books = Book.find(params[:id])
    end

    def new
         @books = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
          redirect_to @book
        else
          render :new
        end
    end
      
    private
        def book_params
            params.require(:book).permit(:title, :author, :description, :image_url, :publication_date, :price)
        end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit
        end
    end


    def destroy
        @book = Book.find(params[:id])
        book.destroy
      
        redirect_to books_path
    end

end
