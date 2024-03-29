class BooksController < ApplicationController
  impressionist :actions => [:show]

  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @book = Book.find(params[:id])
    impressionist(@book, nil, unique: [:session_hash])
    @favorite = Favorite.new
    @book_comment = BookComment.new
  end

  def index
    @book = Book.new
    # @books = Book.includes(:favorited_users).sort {|a,b| b.favorites_for_one_week.count <=> a.favorites_for_one_week.count}
    @books = Book.all.order(params[:sort])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :category, :rate)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
