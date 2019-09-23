class ArtistsController < ApplicationController
  before_action :get_artist, only: [:destroy, :show, :edit, :update]

    def index
      @artists = Artist.all
    end

    def show

    end

    def edit

    end

    def new
      @artist = Artist.new
    end

    def update
      @artist.update(artist_params)
      redirect_to @artist
    end

    def create
      @artist = Artist.create(artist_params)
      redirect_to @artist
    end

    def destroy

    end

    private

    def artist_params
      params.require(:artist).permit(:name, :bio)
    end

    def get_artist
      @artist = Artist.find(params[:id])
    end

end