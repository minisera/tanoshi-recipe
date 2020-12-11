class AlbumsController < ApplicationController

  def index
    @albums = Album.index[:cooking_records]
    # @albums = Album.search(params[:type])
    @albums_data = Album.index[:pagination]
  end

  def pagenate
    data = {"offset": params[:offset],"limit": params[:limit]}
    query = data.to_query
    uri = URI.parse("https://cooking-records.herokuapp.com/cooking_records?"+query)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json,symbolize_names: true)
    @albums = result[:cooking_records]
    @albums_data = result[:pagination]
  end

  def search
    @albums = Album.search(params[:type])
    @albums_data = Album.index[:pagination]
  end

end
