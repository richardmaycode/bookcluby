class BookSearchesController < ApplicationController
  def index
    
    @q = params[:q]
    @result = Books::Search.call(@q)
  end

  def new; end

  def create
    @q = params[:q]
    redirect_to book_searches_path(q: @q)
  end
end
