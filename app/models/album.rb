class Album < ApplicationRecord
  # トップページ
  def self.index
    data = { offset: 0, limit: 50 }
    set_recipe_data(data)
  end

  def self.search_type(type)
    data = { offset: 0, limit: count_total }
    set_recipe_data(data).select { |x| x[:recipe_type] == type }
  end

  def self.search_word(word)
    data = { offset: 0, limit: count_total }
    set_recipe_data(data).select { |x| x[:comment].include?(word) }
  end

  def self.pagenate(offset, limit)
    data = { offset: offset, limit: limit }
    set_recipe_data(data)
  end

  # 外部APIから、JSONを取得しハッシュを返す
  def self.set_recipe_data(data)
    query = data.to_query
    uri = URI.parse('https://cooking-records.herokuapp.com/cooking_records?' + query)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json, symbolize_names: true)
    result[:cooking_records]
  end

  # 現在の記録数の合計を返す
  def self.count_total
    uri = URI.parse('https://cooking-records.herokuapp.com/cooking_records')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json, symbolize_names: true)
    result[:pagination][:total]
  end
end
