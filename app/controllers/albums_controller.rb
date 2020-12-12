class AlbumsController < ApplicationController
before_action :set_album_data

  def index
    @albums = Album.index[:cooking_records]
  end
  
  def search_type
    @albums = Album.search_type(params[:type])
  end
  
  def search_word
    @albums = Album.search_word(params[:word])
  end
  
  def pagenate
    @albums = Album.pagenate(params[:offset],params[:limit])
  end
  
private
  
  def set_album_data
    @albums_data = Album.index[:pagination]
  end

end
