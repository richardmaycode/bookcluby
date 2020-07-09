class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destory]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    if params[:book]
      @book = Books::GetDetail.call(params[:book])
    else
      @book = Book.new
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
  end
end
