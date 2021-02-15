class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update]
  def index
    @artists = Artist.all
  end
  
  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(check_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @artist.update(check_params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end

  private
    def find_artist
      @artist = Artist.find(params[:id])
    end

    def check_params(*args)
      params.require(:artist).permit(*args)
    end
end
