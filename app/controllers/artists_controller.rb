class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        find_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)
        redirect_to artist_path(@artist)
    end

    def edit
        find_artist
    end

    def update
        @artist = find_artist
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

    def find_artist
        @artist = Artist.find_by(id: params[:id])
    end
end
