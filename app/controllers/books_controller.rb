class BooksController < ApplicationController
  before_action :move_to_index, only: [:edit, :update]

  def index
    @book = Book.new 
    @books = Book.all
  end

  def show
    @new_book = Book.new 
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end



  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


 private

  def move_to_index
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to '/books'
    end
  end


  def book_params
    params.require(:book).permit(:title, :body)
  end
end
