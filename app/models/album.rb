class Album < ApplicationRecord

  def self.total_count
    uri = URI.parse("https://cooking-records.herokuapp.com/cooking_records")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json,symbolize_names: true)
    total = result[:pagination][:total]
  end
  
  def self.index
    data = {limit: Album.total_count}
    query = data.to_query
    uri = URI.parse("https://cooking-records.herokuapp.com/cooking_records?"+query)
    json = Net::HTTP.get(uri)
    return JSON.parse(json,symbolize_names: true)
  end

  def self.search(type)
    uri = URI.parse("https://cooking-records.herokuapp.com/cooking_records")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json,symbolize_names: true)
    result[:cooking_records].select{|x| x[:recipe_type] == type}
  end


end