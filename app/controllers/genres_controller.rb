class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update]

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(name: params[:genre][:name])
    redirect_to genre_path(@genre)
  end

  def edit
  end

  def update
    @genre = Genre.update(name: params[:genre][:name])
    redirect_to genre_path(@genre)
  end

  def set_genre
    @genre = Genre.all.find(params[:id])
  end
end
