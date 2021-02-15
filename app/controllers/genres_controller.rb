class GenresController < ApplicationController
  before_action :get_genre, only: [:edit, :show, :destroy, :update]

  def index
    @genres = Genre.all
  end

  def show

  end

  def edit

  end

  def new
    @genre = Genre.new
  end

  def update
    @genre.update(genre_params)
    redirect_to @genre
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to @genre
  end

  def destroy

  end

   private

   def genre_params
     params.require(:genre).permit(:name)
   end

   def get_genre
     @genre = Genre.find(params[:id])
   end
end