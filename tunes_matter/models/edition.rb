require_relative("../db/sql_runner.rb")
require_relative("./album.rb")
require_relative("./artist.rb")

class Edition

  attr_reader :id, :markup
  attr_accessor :title_id, :format, :version_notes, :collectible, :edition_release_year, :number_in_stock, :supplier_price, :retail_price

  def initialize(params)
    @id = params['id'].to_i()
    @title_id = params['title_id'].to_i()
    @format = params['format'].downcase
    @version_notes = params['version_notes'].downcase
    @collectible = params['collectible'].downcase
    @edition_release_year = params['edition_release_year'].to_i()
    @number_in_stock = params['number_in_stock'].to_i()
    @supplier_price = params['supplier_price'].to_i()
    @retail_price = params['retail_price'].to_i
    @markup = (@retail_price - @supplier_price).to_i
  end

  def save()
    sql = "INSERT INTO editions (title_id, format, version_notes, collectible, edition_release_year, number_in_stock, supplier_price, retail_price, markup) VALUES (#{@title_id}, '#{@format}', '#{@version_notes}', '#{@collectible}', #{@edition_release_year}, #{@number_in_stock}, #{@supplier_price}, #{@retail_price}, #{@markup}) RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i()
  end

  def Edition.delete_all()
    sql = "DELETE FROM editions;"
    SqlRunner.run(sql)
  end


  def delete()
    sql = "DELETE FROM editions WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Edition.all()
    sql = "SELECT * FROM editions ORDER BY collectible, number_in_stock ASC;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|edition| Edition.new(edition)}
  end

  def Edition.markup()
    sql = "SELECT * FROM editions ORDER BY markup ASC;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|edition| Edition.new(edition)}
  end

  def Edition.find(id)
    sql = "SELECT * FROM editions WHERE id = #{id}"
    returned_result = SqlRunner.run(sql)
    return Edition.new(returned_result.first())
  end

  def update()
    sql = "UPDATE editions SET (title_id, format, version_notes, collectible, edition_release_year, number_in_stock, supplier_price, retail_price) = (#{@title_id}, '#{@format}', '#{@version_notes}', '#{@collectible}', #{@edition_release_year}, #{@number_in_stock}, #{@supplier_price}, #{@retail_price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT * FROM artists ar INNER JOIN albums al ON ar.id = al.artist_id WHERE al.id = #{@title_id};"
    returned_result = SqlRunner.run(sql)
    return Artist.new(returned_result.first())
  end

  def album
    sql = "SELECT * FROM albums WHERE id = #{@title_id};"
    returned_result = SqlRunner.run(sql)
    return Album.new(returned_result.first())
  end


end
