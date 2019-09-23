class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
        @genre = Genre.find(@song.genre_id)
        @artist = Artist.find(@song.artist_id)
    end

    def new
        @song = Song.new
        @genres = Genre.all
        @artists = Artist.all
    end

    def create
        @song = Song.new(params.require(:song).permit(:name, :genre_id, :artist_id))
        @song.save
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(params.require(:song).permit(:name, :genre_id, :artist_id))
        redirect_to song_path(@song)
    end

    def index
        @songs = Song.all
    end
end
