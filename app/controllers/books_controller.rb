class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]) 
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)

    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id]) 
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search
    @query = params[:query]
    @books = Book.joins(:categories).where("categories.name LIKE ?", "%#{@query}%")

  end

  def sports_filter
     
    @books = Book.joins(:categories).where(categories: {name: "sports"})
    render 'index'
  end

  def travel_filter

    @books = Book.joins(:categories).where(categories: {name: "travel"})
    render 'index'
  end

  def entertainment_filter

    # Book.joins(:categories).where(categories: {name: "sports"}, categories: {name: "travel"})  
    @books = Book.joins(:categories).where(categories: {name: "entertainment"})
    render 'index'
  end

  def sports_travel
    @books = Book.joins(:categories).where(categories: {name: "sports"}, categories: {name: "travel"}) 
    render 'index'
  end

  def sports_entertainment
    @books = Book.joins(:categories).where(categories: {name: "sports"}, categories: {name: "entertainment"})
    # @books = Book.includes(:categories).where(categories: {name:"sports"}).and(Book.includes(:categories).where(categories: {name:"entertainment"}))
    render 'index'
  end

  def entertainment_travel
    @books = Book.joins(:categories).where(categories: {name: "entertainment"}, categories: {name: "travel"}) 
    render 'index'
  end
  
  def sort_ascending
    @books = Book.all.order(price: :asc)
    render 'index'
  end

  def sort_descending
    @books = Book.all.order(price: :desc)
    render 'index'
  end

  private
  def book_params
    params.require(:book).permit(:title, :description,:price, :image, category_ids: [])
  end

  
end
