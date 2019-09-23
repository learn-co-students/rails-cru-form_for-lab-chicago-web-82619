class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update]
  def index
    @songs = Song.all
  end
  
  def show
    @artist = Artist.find_by(id: @song.artist_id)
    @genre = Genre.find_by(id: @song.genre_id)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(check_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def edit
  end

  def update
    @song.update(check_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  private
    def find_song
      @song = Song.find(params[:id])
    end

    def check_params(*args)
      params.require(:song).permit(*args)
    end
end
