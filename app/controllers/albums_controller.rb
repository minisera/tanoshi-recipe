class AlbumsController < ApplicationController
  def index
    @albums = Album.index
  end

  def search_type
    @albums = Album.search_type(params[:type])
  end

  def search_word
    @albums = Album.search_word(params[:word])
  end

  def pagenate
    @albums = Album.pagenate(params[:offset], params[:limit])
  end

  def show
  end
end
