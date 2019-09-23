class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    find_genre
  end

  def new
    @genre = Genre.new
  end

  def create
    # raise params.inspect
    @genre = Genre.new(params.require(:genre).permit(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  def edit
    find_genre
  end

  def update
    find_genre
    @genre.update(params.require(:genre).permit(:name))
    redirect_to genre_path(@genre)
  end

  private
  def find_genre
    @genre = Genre.find(params[:id])
  end

end
