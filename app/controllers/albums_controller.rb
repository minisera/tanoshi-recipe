class AlbumsController < ApplicationController

  def index
    uri = URI.parse("https://cooking-records.herokuapp.com/cooking_records")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @albums = result["cooking_records"]
    @albums_data = result["pagination"]
  end

  def pagenate
    data = {"offset": params[:offset],"limit": params[:limit]}
    query = data.to_query
    uri = URI.parse("https://cooking-records.herokuapp.com/cooking_records?"+query)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @albums = result["cooking_records"]
    @albums_data = result["pagination"]
  end

end
