require_relative("../db/sql_runner.rb")
require_relative("./album.rb")
require_relative("./edition.rb")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i()
    @name = params['name'].downcase
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;"
    returned_result = SqlRunner.run(sql)
    @id = returned_result.first()['id'].to_i()
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def Artist.all()
    sql = "SELECT * FROM artists ORDER BY name ASC;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|artist| Artist.new(artist)}
  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    returned_result = SqlRunner.run(sql)
    return Artist.new(returned_result.first())
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


  def all_albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id} ORDER BY original_release_year ASC;"
    returned_result = SqlRunner.run(sql)
    return returned_result.map {|album| Album.new(album)}
  end

  def Artist.name_search(search_string)
    sql = "SELECT * FROM artists WHERE name LIKE '%#{search_string}%';"
    returned_result = SqlRunner.run(sql)
    return returned_result.map{|artist| Artist.new(artist)}
  end

end
