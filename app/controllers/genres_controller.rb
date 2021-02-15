class GenresController < ApplicationController
  before_action :find_genre, only: [:show, :edit, :update]
  def index
    @genres = Genre.all
  end
  
  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(check_params(:name))
    redirect_to genre_path(@genre)
  end

  def edit
  end

  def update
    @genre.update(check_params(:name))
    @genre.save
    redirect_to genre_path(@genre)
  end

  private
    def find_genre
      @genre = Genre.find(params[:id])
    end

    def check_params(*args)
      params.require(:genre).permit(*args)
    end
end
