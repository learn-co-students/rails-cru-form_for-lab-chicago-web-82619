class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update]

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(name: params[:artist][:name], bio: params[:artist][:bio])
    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @artist = Artist.update(name: params[:artist][:name], bio: params[:artist][:bio])
    redirect_to artist_path(@artist)
  end

  def set_artist
    @artist = Artist.all.find(params[:id])
  end
end
